//
//  Movie.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 06/07/22.
//

import Foundation
import CoreLocation

// MARK: - Stadium
struct Movie: Codable {
    var category: String?
    var imageUrl: String?
    var name: String?
    var desc: String?
    var lattitude: CLLocationDegrees?
    var longtitude: CLLocationDegrees?
    mutating func updateLatLong(lat: CLLocationDegrees?, long: CLLocationDegrees?) {
        self.lattitude = lat
        self.longtitude = long
    }
}
