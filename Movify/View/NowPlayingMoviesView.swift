//
//  NowPlayingMoviesView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct NowPlayingMoviesView: View {
    @StateObject var viewModel: NowPlayingMoviesViewModel = .init()

    var body: some View {
        VStack(alignment: .leading) {
            headerView
            switch viewModel.loadingState {
            case .idle:
                Color.white.onAppear {
                    viewModel.getNowPlayingMovies()
                }
            case .loading:
                LoadingView()
            case .loaded:
                movieList
            case .failed:
                errorView
            }
        }
    }
    
    var headerView: some View {
        Text("Now Playing Movies")
            .font(.headline)
    }
    
    var errorView: some View {
        Text("Sorry, some error from our end. Please try again later.")
            .font(.caption)
            .foregroundColor(.red)
    }

    @ViewBuilder
    var movieList: some View {
        if let result = viewModel.nowPlayingMovies?.results {
            ScrollView { // Vertical ScrollView
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 4) { // Adaptive Grid
                    ForEach(result, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie, onBookmarkTapped: {})) {
                            MoviePosterView(
                                title: movie.originalTitle,
                                poster: ImageLoaderView(urlString: movie.posterPath)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        } else {
            Text("No movies to display.")
                .padding()
        }
    }
}
