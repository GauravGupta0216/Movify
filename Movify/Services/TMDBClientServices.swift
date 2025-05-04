//
//  TMDBClientServices.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import Foundation
import Combine

final class TMDBClient: TMDBService {
    func fetchTrending() -> AnyPublisher<MoviesModel, NetworkError> {
        let query: [String: String] = ["language": "en-US"]
        return NetworkService.shared.request(path: MovifyConstants.trendingMoviePath, query: query)
    }

    func fetchNowPlaying() -> AnyPublisher<MoviesModel, NetworkError> {
        let query: [String: String] = ["language": "en-US"]
        return NetworkService.shared.request(path: MovifyConstants.nowPlayingPath, query: query)
    }
}
