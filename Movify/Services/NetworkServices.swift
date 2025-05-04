//
//  NetworkService.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//


import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

class NetworkService {
    private let apiKey = "YOUR_API_KEY"
    private let baseURL = URL(string: MovifyConstants.tmdbBaseUrl)!
    
    static let shared = NetworkService()

    private init() {}

    func request<T: Decodable>(
        path: String,
        method: String = "GET",
        query: [String: String] = [:],
        headers: [String: String] = [:]
    ) -> AnyPublisher<T, NetworkError> {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        // Add query items
        let queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        components.queryItems = (components.queryItems ?? []) + queryItems
        
        guard let finalURL = components.url else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer " + apiKey
        ].merging(headers) { (_, new) in new }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw NetworkError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is NetworkError:
                    return error as! NetworkError
                case is DecodingError:
                    return NetworkError.decodingError(error)
                default:
                    return NetworkError.requestFailed(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
