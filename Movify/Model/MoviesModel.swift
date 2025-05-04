//
//  MoviesModel.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import Foundation

struct MoviesModel: Decodable {
    let dates: Dates?
    let page: Int?
    let results: [MovieModel]?
    let totalPages: Int?
    let totalResults: Int?

    struct Dates: Decodable {
        let maximum: String
        let minimum: String
    }

    enum CodingKeys: String, CodingKey {
        case results
        case dates
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct MovieModel: Decodable {
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
