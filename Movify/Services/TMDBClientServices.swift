//
//  TMDBClientServices.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import Foundation
import Combine

final class TMDBClient: TMDBService {
    private let apiKey = "YOUR_API_KEY"
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    
    func fetchTrending(page: Int = 1) -> AnyPublisher<MoviesModel, Error> {
        let path = "/trending/movie/day"
        let query: [String: String] = ["language": "en-US"]
        return request(path: path, query: query)
    }

    func fetchNowPlaying(page: Int = 1) -> AnyPublisher<MoviesModel, Error> {
        request(path: "/movie/now_playing", query: ["page": "\(page)"])
    }
    
    private func request<T: Decodable>(path: String, query: [String: String]) -> AnyPublisher<T, Error> {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        // Add query items
        let queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        components.queryItems = (components.queryItems ?? []) + queryItems
        
        guard let finalURL = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer " + apiKey
        ]
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
