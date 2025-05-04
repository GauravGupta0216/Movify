//
//  HomeView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HeaderView(header: MovifyConstants.homeHeader)
                    TrendingMoviesView()
                    NowPlayingMoviesView()
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
        }
    }
}
