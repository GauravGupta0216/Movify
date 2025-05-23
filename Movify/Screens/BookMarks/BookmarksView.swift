//
//  BookmarksView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct BookmarksView: View {
    @StateObject var viewModel: BookmarkViewModel = .init()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HeaderView(header: MovifyConstants.bookmarksHeader)
                List {
                    ForEach(viewModel.bookmarkedMovies, id: \.id) { movie in
                        MovieRowView(movie: viewModel.convertToMovieModel(movie: movie))
                    }
                }
            }
            .onAppear {
                viewModel.fetchBookmarks()
            }
            .padding(.horizontal)
        }
    }
}
