//
//  Movie.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 06/07/22.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]?
}
// MARK: - Stadium
struct Movie: Codable {
    var category: String?
    var imageUrl: String?
    var name: String?
    var desc: String?
}
