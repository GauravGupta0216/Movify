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
            VStack(alignment: .leading) {
                Text("Home")
                    .font(.title)
                    .padding(.bottom, 16)
                TrendingMoviesView()
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}
