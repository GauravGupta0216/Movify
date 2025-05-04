//
//  ContentView.swift
//  Movify
//
//  Created by Gaurav Kumar on 29/04/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(MovifyConstants.homeHeader, systemImage: MovifyConstants.houseFill)
                }

            SearchView()
                .tabItem {
                    Label(MovifyConstants.searchHeader, systemImage: MovifyConstants.magnifyingglass)
                }

            BookmarksView()
                .tabItem {
                    Label(MovifyConstants.bookmarksHeader, systemImage: MovifyConstants.heartFill)
                }
        }
    }
}
