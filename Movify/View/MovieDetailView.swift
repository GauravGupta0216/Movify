//
//  MovieDetailView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: MovieModel
    var onBookmarkTapped: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MoviePosterView(movie: movie)
                MovieTitleView(movie: movie)
                MovieGenreView(movie: movie)
                MovieOverviewView(movie: movie)
                Spacer()
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            BookmarkButtonView(onBookmarkTapped: onBookmarkTapped)
        }
    }
}

private struct MoviePosterView: View {
    let movie: MovieModel

    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
            @unknown default:
                EmptyView()
            }
        }
        .padding(.bottom)
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
    var onBookmarkTapped: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button {
                onBookmarkTapped()
            } label: {
                Image(systemName: "heart")
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
    MovieDetailView(movie: MovieModel(adult: false, backdropPath: "/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg", genreIds: [28, 12, 878], id: 1197306, originalLanguage: "en", originalTitle: "A Working Man", overview: "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.", popularity: 633.0389, posterPath: "/xUkUZ8eOnrOnnJAfusZUqKYZiDu.jpg", releaseDate: "2025-03-26", title: "A Working Man", video: false, voteAverage: 6.4, voteCount: 477), onBookmarkTapped: {
        print("Bookmark Tapped")
    })
}
