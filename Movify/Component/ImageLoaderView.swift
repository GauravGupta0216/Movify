//
//  ImageLoaderView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//


import SwiftUI

struct ImageLoaderView: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: MovifyConstants.imageURLPath + urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            case .failure:
                Image(systemName: MovifyConstants.photo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
            @unknown default:
                EmptyView()
            }
        }
    }
}
