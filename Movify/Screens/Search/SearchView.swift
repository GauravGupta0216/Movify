//
//  SearchView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var allMovies: [MovieModel] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(header: "Search")
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
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
                    ForEach(filteredMovies, id: \.id) { movie in
                        MovieRowView(movie: movie)
                    }
                }
            }
        }
        .padding(.horizontal)
    }

    // Computed property for filtered movies
    var filteredMovies: [MovieModel] {
        if searchText.isEmpty {
            return allMovies
        } else {
            return allMovies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

// Preview
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
