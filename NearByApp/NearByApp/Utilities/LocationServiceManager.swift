//
//  LocationServiceManager.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 06/07/22.
//

import Foundation
import CoreLocation

class LocationServiceManager: NSObject {
    // MARK: - Type
    typealias PermissionDenied = () -> Void
    typealias LocationRetrieved = (CLLocation) -> Void
    
    
    // MARK: - Properties
    private let locationManager: CLLocationManager?
     var currentLocation: CLLocation?
    private var permissionDenied: PermissionDenied?
    private var locationRetrieved: LocationRetrieved?
    
    // MARK: - Constructors
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }
    // MARK: - Exposed Methods
    func setup(permissionDenied: @escaping PermissionDenied, locationRetrieved: @escaping LocationRetrieved) {
        
        self.permissionDenied = permissionDenied
        self.locationRetrieved = locationRetrieved
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        requestLocationServiceWhenInUse()
        locationManager?.startUpdatingLocation()
    }
    // MARK: - Protected Methods
    private func requestLocationServiceWhenInUse() {
        let authorizationStatus: CLAuthorizationStatus?
        if #available(iOS 14, *) {
            authorizationStatus = locationManager?.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        switch authorizationStatus {
        case .authorizedWhenInUse:
            locationManager?.requestWhenInUseAuthorization()
        case .denied, .restricted:
            permissionDenied?()
        case .authorizedAlways, .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
         default:
            break
        }
    }
}
// MARK: - Delegate Methods
extension LocationServiceManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !locations.isEmpty {
            currentLocation = locations.first
            if let location = currentLocation {
                locationRetrieved?(location)
                locationManager?.stopUpdatingLocation()
            }
            
        } else {
            permissionDenied?()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            if let location = currentLocation {
                locationRetrieved?(location)

            } else {
                locationManager?.startUpdatingLocation()
            }
        case .denied, .notDetermined:
            locationManager?.stopUpdatingLocation()
        default:
            permissionDenied?()
            
        }
    }
}
