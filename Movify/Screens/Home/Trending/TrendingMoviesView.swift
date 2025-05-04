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
        Text(MovifyConstants.trendingMovies)
            .font(.headline)
    }
    
    var errorView: some View {
        Text(MovifyConstants.sorryError)
            .font(.caption)
            .foregroundColor(.red)
    }

    @ViewBuilder
    var movieList: some View {
        if let result = viewModel.trendingMovies?.results {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(result, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MoviePosterView(
                                title: movie.originalTitle,
                                poster: ImageLoaderView(urlString: movie.posterPath)
                            )
                        }
                    }
                }
            }
        }
    }
}
