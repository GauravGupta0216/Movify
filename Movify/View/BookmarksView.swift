//
//  BookmarksView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct BookmarksView: View {
    @State private var bookmarkedMovies: [BookmarkedMovie] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(bookmarkedMovies, id: \.id) { movie in
                    BookmarkRow(movie: movie)
                }
            }
            .navigationTitle("Bookmarks")
            .onAppear {
                fetchBookmarks()
            }
        }
    }

    func fetchBookmarks() {
        bookmarkedMovies = CoreDataManager.shared.fetchBookmarkedMovies()
    }
}

struct BookmarkRow: View {
    let movie: BookmarkedMovie

    var body: some View {
        NavigationLink(destination: MovieDetailView(movie: convertToMovieModel(movie: movie))) {
            HStack {
                ImageLoaderView(urlString: movie.posterPath ?? "")
                    .frame(width: 50, height: 75)
                Text(movie.title ?? "Unknown")
            }
        }
    }

    private func convertToMovieModel(movie: BookmarkedMovie) -> MovieModel {
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
