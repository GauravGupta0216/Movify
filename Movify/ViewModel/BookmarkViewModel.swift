//
//  BookmarkViewModel.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Foundation

final class BookmarkViewModel: ObservableObject {
    @Published var bookmarkedMovies: [BookmarkedMovie] = []

    init() {
        fetchBookmarks()
    }

    func fetchBookmarks() {
        bookmarkedMovies = CoreDataManager.shared.fetchBookmarkedMovies()
    }

    func convertToMovieModel(movie: BookmarkedMovie) -> MovieModel {
        return MovieModel(
            genreIds: movie.genreIds as? [Int] ?? [],
            id: Int(movie.id),
            originalLanguage: movie.originalLanguage ?? "en",
            originalTitle: movie.originalTitle ?? "Unknown",
            overview: movie.overview ?? "No overview available",
            posterPath: movie.posterPath ?? "",
            releaseDate: movie.releaseDate ?? "Unknown",
            title: movie.title ?? "Unknown"
        )
    }
}
