//
//  TrendingMoviesViewModel.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Foundation
import Combine

final class TrendingMoviesViewModel: ObservableObject {
    @Published var trendingMovies: MoviesModel?
    @Published var loadingState: ScreenState = .idle
    
    private var service: TMDBService
    private var cancellables: Set<AnyCancellable> = []

    init() {
        #if MOCK
        service = MockTMDBClient()
        #else
        service = TMDBClient()
        #endif
    }

    func getTrendingMovies() {
        self.loadingState = .loading
        service.fetchTrending()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] status in
                guard let self else { return }
                switch status {
                case .finished:
                    self.loadingState = .loaded
                    print("finished with success")
                case .failure(let failure):
                    self.loadingState = .failed
                    print("failed with error: \(failure)")
                }
            }, receiveValue: { [weak self] response in
                self?.trendingMovies = response
                print(response)
            })
            .store(in: &cancellables)
    }
}
