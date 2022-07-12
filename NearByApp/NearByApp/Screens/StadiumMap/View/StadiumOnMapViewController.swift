//
//  StadiumOnMapViewController.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 06/07/22.
//

import UIKit
import MapKit

class StadiumOnMapViewController: UIViewController {
    var stadiumModel: Stadium?
    var movieModel: Movie?
    
    // MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var navigationTitle = ""
        if stadiumModel != nil {
            navigationTitle = "Stadium"
            updateLocationOnMap(to: CLLocation(latitude: stadiumModel?.lattitude ?? 0.0, longitude: stadiumModel?.longtitude ?? 0.0), with: stadiumModel?.name)
        } else if  movieModel != nil {
            navigationTitle = "Movie"
            updateLocationOnMap(to: CLLocation(latitude: movieModel?.lattitude ?? 0.0, longitude: movieModel?.longtitude ?? 0.0), with: movieModel?.name)
        }
        self.navigationItem.title = "\(navigationTitle) location on map"
        
    }
    // MARK: - Pinannotation on Map
    func updateLocationOnMap(to location: CLLocation, with title: String?) {
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = location.coordinate
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.mapView.addAnnotation(point)
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        self.mapView.setRegion(viewRegion, animated: true)
    }
    
}
