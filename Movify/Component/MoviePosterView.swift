//
//  MoviePosterView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct MoviePosterView: View {
    let title: String
    let poster: ImageLoaderView

    var body: some View {
        VStack {
            poster
                .frame(width: 100, height: 180)
                .padding(.bottom, 8)
            Text(title)
                .font(.headline)
                .foregroundStyle(.black)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MoviePosterView(title: "Dune: Part two", poster: ImageLoaderView(urlString: "DunePoster"))
}
