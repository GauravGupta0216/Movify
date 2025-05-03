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
        Text("Hello World")
            .task {
                do {
                    try await homeViewModel.fetchTrendingMovies()
                } catch {
                    print(error)
                }
            }
    }
}
