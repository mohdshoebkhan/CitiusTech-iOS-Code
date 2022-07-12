//
//  RandomLocations.swift
//  MVVMExample
//
//  Created by Mohd Shoeb on 06/07/22.
//

import Foundation
import CoreLocation

struct RandomLocations {
    
    // MARK: - Create random locations around user's current location
    func getMockLocationsFor(location: CLLocation?, movieArray: [Movie]?, callBack:@escaping APICallBack) {
        func getBase(number: Double) -> Double {
            return round(number * 1000)/1000
        }
        func randomCoordinate() -> Double {
            return Double(arc4random_uniform(140)) * 0.0001
        }
        let baseLatitude = getBase(number: (location?.coordinate.latitude ?? 0.00) - 0.007)
        let baseLongitude = getBase(number: (location?.coordinate.longitude ?? 0.00) - 0.008)
        
        var items = [Movie]()
        movieArray?.forEach({ movie in
            var movie = movie
            let randomLat = baseLatitude + randomCoordinate()
            let randomLong = baseLongitude + randomCoordinate()
            movie.updateLatLong(lat: randomLat, long: randomLong)
            items.append(movie )
        })
        callBack(nil, items)
    }
}
