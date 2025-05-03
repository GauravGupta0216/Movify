//
//  ImageLoaderView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//


import SwiftUI

struct ImageLoaderView: View {
    let imageUrlPath: String = "https://image.tmdb.org/t/p/w500"
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrlPath + urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image("DunePoster")
                    .resizable()
            @unknown default:
                EmptyView()
            }
        }
    }
}
