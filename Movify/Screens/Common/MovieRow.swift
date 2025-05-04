//
//  MovieRow.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct MovieRowView: View {
    let movie: MovieModel
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: movie.posterPath)
                .frame(width: 50, height: 75)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(String(movie.releaseDate))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer() // Push content to the left
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
