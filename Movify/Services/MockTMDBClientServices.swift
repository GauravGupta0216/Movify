//
//  MockTMDBClient.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//
//  MockTMDBClient.swift

import Combine
import Foundation

final class MockTMDBClient: TMDBService {
    let mockData = MockData()

    func fetchTrending(page: Int = 1) -> AnyPublisher<MoviesModel, Error> {
        return Future<MoviesModel, Error> { promise in
            let trendingMovies: MoviesModel = self.mockData.load("trending.json")
            promise(.success(trendingMovies))
        }
        .eraseToAnyPublisher()
    }

    func fetchNowPlaying(page: Int = 1) -> AnyPublisher<MoviesModel, Error> {
        return Future<MoviesModel, Error> { promise in
            let nowPlayingMovies: MoviesModel = self.mockData.load("now_playing.json")
            promise(.success(nowPlayingMovies))
        }
        .eraseToAnyPublisher()
    }
}
