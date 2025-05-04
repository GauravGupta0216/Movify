//
//  MovifyConstants.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//


import Foundation

struct MovifyConstants {
    static let bookmarksHeader = "Bookmarks"
    static let homeHeader = "Home"
    static let searchHeader = "Search"
    static let sorryError = "Sorry, some error from our end. Please try again later."
    static let noMovies = "No movies to display."
    static let overview = "Overview"
    static let trendingMovies = "Trending Movies"
    static let nowPlayingMovies = "Now Playing Movies"

    // MARK: - Image Names
    static let photo = "photo"
    static let magnifyingglass = "magnifyingglass"
    static let heartFill = "heart.fill"
    static let heart = "heart"
    static let houseFill = "house.fill"
    
    // MARK: - URL/Path
    static let tmdbBaseUrl = "https://api.themoviedb.org/3"
    static let imageURLPath = "https://image.tmdb.org/t/p/w500"
    static let trendingMoviePath = "/trending/movie/day"
    static let nowPlayingPath = "/movie/now_playing"
}
