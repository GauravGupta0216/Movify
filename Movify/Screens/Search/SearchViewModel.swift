//
//  SearchViewModel.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Foundation
import Combine

/*
    Using Now Playing Service call to get the list of movie
*/

final class SearchViewModel: ObservableObject {
    @Published var nowPlayingMovies: [MovieModel] = []
    @Published var searchText = ""
    @Published var loadingState: ScreenState = .idle
    
    private var service: TMDBService
    private var cancellables: Set<AnyCancellable> = []

    var filteredMovies: [MovieModel] {
        if searchText.isEmpty {
            return nowPlayingMovies
        } else {
            return nowPlayingMovies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    init() {
        #if MOCK
        service = MockTMDBClient()
        #else
        service = TMDBClient()
        #endif
    }

    func getNowPlayingMovies() {
        self.loadingState = .loading
        service.fetchNowPlaying()
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
                self?.nowPlayingMovies = response.results ?? []
                print(response)
            })
            .store(in: &cancellables)
    }
}
