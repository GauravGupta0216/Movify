//
//  MovieDetailViewModel.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import Foundation
import CoreData

final class MovieDetailViewModel: ObservableObject {
    @Published var isBookmarked: Bool = false
    let movie: MovieModel

    init(movie: MovieModel) {
        self.movie = movie
    }

    func onBookmarkTapped() {
        if isBookmarked {
            CoreDataManager.shared.deleteMovie(movieID: movie.id)
        } else {
            CoreDataManager.shared.saveMovie(movie: movie)
        }
        isBookmarked.toggle()
    }

    func checkIfMovieIsBookmarked() {
        let fetchRequest: NSFetchRequest<BookmarkedMovie> = BookmarkedMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", Int32(movie.id))
        
        do {
            let results = try CoreDataManager.shared.container.viewContext.fetch(fetchRequest)
            isBookmarked = !results.isEmpty
        } catch {
            print("Failed to check bookmark status: \(error)")
        }
    }
}
