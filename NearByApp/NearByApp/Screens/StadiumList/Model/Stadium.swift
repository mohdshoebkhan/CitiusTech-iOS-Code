//
//  Stadium.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import Foundation
import CoreLocation
typealias Stadiums = [Stadium]

// MARK: - Stadium
struct Stadium {
    var name: String?
    var desc: String?
    var lattitude: CLLocationDegrees
    var longtitude: CLLocationDegrees
}
