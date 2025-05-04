//
//  MovifyHelperTests.swift
//  MovifyTests
//
//  Created by Gaurav Kumar on 04/05/25.
//

import XCTest
@testable import Movify

final class MovifyHelperTests: XCTestCase {

    var helper: MovifyHelper!

    override func setUpWithError() throws {
        // Initialize the helper before each test
        helper = MovifyHelper()
    }

    override func tearDownWithError() throws {
        // Deallocate the helper after each test
        helper = nil
    }

    func testGetGenreNameForKnownGenreIds() throws {
        XCTAssertEqual(helper.getGenreName(from: 28), "Action", "Genre ID 28 should return 'Action'")
        XCTAssertEqual(helper.getGenreName(from: 12), "Adventure", "Genre ID 12 should return 'Adventure'")
        XCTAssertEqual(helper.getGenreName(from: 878), "Sci-Fi", "Genre ID 878 should return 'Sci-Fi'")
        XCTAssertEqual(helper.getGenreName(from: 15), "Thriller", "Genre ID 15 should return 'Thriller'")
        XCTAssertEqual(helper.getGenreName(from: 18), "Thriller", "Genre ID 18 should return 'Thriller'")
    }

    func testGetGenreNameForUnknownGenreId() throws {
        XCTAssertEqual(helper.getGenreName(from: 999), "Fiction", "Unknown Genre ID should return 'Fiction'")
    }
}
