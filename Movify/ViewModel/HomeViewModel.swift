//
//  HomeViewModel.swift
//  Movify
//
//  Created by Gaurav Kumar on 01/05/25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var trendingMovies: MoviesModel?
    var cancellable = Set<AnyCancellable>()

    #if MOCK
    let tmdbService = MockTMDBClient()
    #else
    let tmdbService = TMDBClient()
    #endif

    func fetchTrendingMovies() async throws {
        tmdbService.fetchTrending()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                switch status {
                case .finished:
                    print("finished with success")
                case .failure(let failure):
                    print("failed with error: \(failure)")
                }
            }, receiveValue: { [weak self] response in
                self?.trendingMovies = response
                print(response)
            })
            .store(in: &cancellable)
    }
}
