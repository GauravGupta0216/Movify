//
//  TrendingMovieView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct TrendingMoviesView: View {
    @StateObject var viewModel: TrendingMoviesViewModel = .init()

    var body: some View {
        VStack(alignment: .leading) {
            headerView
            switch viewModel.loadingState {
            case .idle:
                Color.white.onAppear {
                    viewModel.getTrendingMovies()
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
        Text("Trending Movies")
            .font(.headline)
    }
    
    var errorView: some View {
        Text("Sorry, some error from our end. Please try again later.")
            .font(.caption)
            .foregroundColor(.red)
    }

    @ViewBuilder
    var movieList: some View {
        if let result = viewModel.trendingMovies?.results {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(result, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie, onBookmarkTapped: {})) {
                            PosterView(
                                title: movie.originalTitle,
                                poster: ImageLoaderView(urlString: movie.posterPath)
                            )
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
