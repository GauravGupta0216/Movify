//
//  TMDBClientServices.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import Foundation
import Combine

final class TMDBClient {
    private let apiKey = "YOUR_API_KEY"
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    
    func fetchTrending(page: Int = 1) -> AnyPublisher<MovieModel, Error> {
        request(path: "/trending/movie/day", query: ["page": "\(page)"])
    }
    
    func fetchNowPlaying(page: Int = 1) -> AnyPublisher<MovieModel, Error> {
        request(path: "/movie/now_playing", query: ["page": "\(page)"])
    }
    
    func search(query: String, page: Int = 1) -> AnyPublisher<MovieModel, Error> {
        request(path: "/search/movie", query: ["query": query, "page": "\(page)"])
    }
    
    private func request<T: Decodable>(path: String, query: [String:String])
    -> AnyPublisher<T, Error> {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        components.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        components.queryItems?.append(URLQueryItem(name: "api_key", value: apiKey))
        let req = URLRequest(url: components.url!)
        return URLSession.shared.dataTaskPublisher(for: req)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
