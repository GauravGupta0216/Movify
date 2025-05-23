//
//  SearchView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = .init()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HeaderView(header: MovifyConstants.searchHeader)
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
            .padding(.horizontal)
        }
    }

    var movieList: some View {
        VStack {
            HStack {
                Image(systemName: MovifyConstants.magnifyingglass)
                    .foregroundColor(.gray)
                TextField(MovifyConstants.searchHeader, text: $viewModel.searchText)
                    .autocapitalization(.none)
            }
            .padding(8)
            .background(Color(.systemGray6)) // Use system color
            .cornerRadius(8)
            .padding(.horizontal)
            
            // Display Results
            ScrollView {
                VStack(alignment: .leading) {
                    // Filtered Movies
                    ForEach(viewModel.filteredMovies, id: \.id) { movie in
                        MovieRowView(movie: movie)
                    }
                }
            }
        }
    }

    var errorView: some View {
        Text(MovifyConstants.sorryError)
            .font(.caption)
            .foregroundColor(.red)
    }
}

// Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
