//
//  TMDBService.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Combine

protocol TMDBService {
    func fetchTrending(page: Int) -> AnyPublisher<MoviesModel, Error>
    func fetchNowPlaying(page: Int) -> AnyPublisher<MoviesModel, Error>
}
