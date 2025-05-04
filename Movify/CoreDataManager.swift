//
//  CoreDataManager.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//


import CoreData
import SwiftUI

class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MovifyDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
        }
    }

    func saveMovie(movie: MovieModel) {
        let context = container.viewContext
        let bookmarkedMovie = BookmarkedMovie(context: context)
        bookmarkedMovie.id = Int32(movie.id)
        bookmarkedMovie.title = movie.title
        bookmarkedMovie.posterPath = movie.posterPath
        bookmarkedMovie.overview = movie.overview
        bookmarkedMovie.releaseDate = movie.releaseDate
        bookmarkedMovie.originalTitle = movie.originalTitle
        bookmarkedMovie.originalLanguage = movie.originalLanguage
        bookmarkedMovie.genreIds = movie.genreIds as NSObject

        do {
            try context.save()
            print("Movie saved!")
        } catch {
            print("Failed to save movie: \(error)")
        }
    }

    func deleteMovie(movieID: Int) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<BookmarkedMovie> = BookmarkedMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", Int32(movieID))

        do {
            let results = try context.fetch(fetchRequest)
            if let movieToDelete = results.first {
                context.delete(movieToDelete)
                try context.save()
                print("Movie deleted!")
            }
        } catch {
            print("Failed to delete movie: \(error)")
        }
    }

    func fetchBookmarkedMovies() -> [BookmarkedMovie] {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<BookmarkedMovie> = BookmarkedMovie.fetchRequest()

        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch movies: \(error)")
            return []
        }
    }
}
