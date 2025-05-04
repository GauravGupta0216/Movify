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
                    Label("Home", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            BookmarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "heart.fill")
                }
        }
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search View Content")
    }
}