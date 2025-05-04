//
//  MockTMDBClient.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Combine
import Foundation

final class MockTMDBClient: TMDBService {
    let mockData = MockData()

    func fetchTrending() -> AnyPublisher<MoviesModel, NetworkError> {
        return Future<MoviesModel, NetworkError> { promise in
            let trendingMovies: MoviesModel = self.mockData.load("trending.json")
            promise(.success(trendingMovies))
        }
        .eraseToAnyPublisher()
    }

    func fetchNowPlaying() -> AnyPublisher<MoviesModel, NetworkError> {
        return Future<MoviesModel, NetworkError> { promise in
            let nowPlayingMovies: MoviesModel = self.mockData.load("now_playing.json")
            promise(.success(nowPlayingMovies))
        }
        .eraseToAnyPublisher()
    }
}
