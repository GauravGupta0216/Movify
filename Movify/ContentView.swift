//
//  ContentView.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Home")
                        .font(.title)
                        .foregroundStyle(.black)
                    TrendingMoviesView()
                    NowPlayingMoviesView()
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
