//
//  MovifyHelper.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

struct MovifyHelper {
    func getGenreName(from genreId: Int) -> String {
        switch genreId {
        case 28: return "Action"
        case 12: return "Adventure"
        case 878: return "Sci-Fi"
        case 15: return "Thriller"
        default: return "Fiction"
        }
    }
}
