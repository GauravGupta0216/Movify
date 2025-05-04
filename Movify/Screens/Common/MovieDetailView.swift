//
//  MovieDetailView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI
import CoreData

struct MovieDetailView: View {
    @State private var isBookmarked: Bool = false
    let movie: MovieModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImageLoaderView(urlString: movie.posterPath)
                MovieTitleView(movie: movie)
                MovieGenreView(movie: movie)
                MovieOverviewView(movie: movie)
                Spacer()
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            BookmarkButtonView(isBookmarked: isBookmarked, onBookmarkTapped: {
                if isBookmarked {
                    CoreDataManager.shared.deleteMovie(movieID: movie.id)
                } else {
                    CoreDataManager.shared.saveMovie(movie: movie)
                }
                isBookmarked.toggle()
            })
            .onAppear {
                checkIfMovieIsBookmarked()
            }
        }
    }
    
    private func checkIfMovieIsBookmarked() {
        let fetchRequest: NSFetchRequest<BookmarkedMovie> = BookmarkedMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", Int32(movie.id))
        
        do {
            let results = try CoreDataManager.shared.container.viewContext.fetch(fetchRequest)
            isBookmarked = !results.isEmpty
        } catch {
            print("Failed to check bookmark status: \(error)")
        }
    }
}

private struct MovieTitleView: View {
    let movie: MovieModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 5)

            Text(movie.releaseDate) // Format the date as needed
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
        }
    }
}

private struct MovieGenreView: View {
    let movie: MovieModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(movie.genreIds, id: \.self) { genreId in
                    Text(MovifyHelper().getGenreName(from: genreId))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                }
            }
        }
        .padding(.bottom, 15)
    }
}

private struct MovieOverviewView: View {
    let movie: MovieModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Overview")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 5)

            Text(movie.overview)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(8)
                .padding(.bottom, 20)
        }
    }
}

private struct BookmarkButtonView: View {
    let isBookmarked: Bool
    var onBookmarkTapped: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button {
                onBookmarkTapped()
            } label: {
                Image(systemName: isBookmarked ? "heart.fill" : "heart")
                    .font(.title2)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

#Preview {
    MovieDetailView(movie: MovieModel(
        genreIds: [28, 12, 878],
        id: 1197306,
        originalLanguage: "en",
        originalTitle: "A Working Man",
        overview: "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.",
        posterPath: "/xUkUZ8eOnrOnnJAfusZUqKYZiDu.jpg",
        releaseDate: "2025-03-26",
        title: "A Working Man")
    )
}
