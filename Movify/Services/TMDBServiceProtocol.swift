//
//  TMDBService.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Combine

protocol TMDBService {
    func fetchTrending() -> AnyPublisher<MoviesModel, NetworkError>
    func fetchNowPlaying() -> AnyPublisher<MoviesModel, NetworkError>
}
