//
//  StadiumOnMapViewControllerTests.swift
//  NearByAppTests
//
//  Created by Mohd Shoeb on 07/07/22.
//

import XCTest
@testable import NearByApp
import CoreLocation
import MapKit
class StadiumOnMapViewControllerTests: XCTestCase {
    var stadiumOnMapVC: StadiumOnMapViewController?
    
    // MARK: - setUp Controller Objects
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(identifier: "StadiumOnMapViewController") as? StadiumOnMapViewController else { fatalError("xib does not exists") }
        self.stadiumOnMapVC = sut
        self.stadiumOnMapVC?.loadViewIfNeeded()
        self.stadiumOnMapVC?.awakeFromNib()
    }
    // MARK: - tearDown Controller Objects
    override func tearDownWithError() throws {
        stadiumOnMapVC = nil
        try super.tearDownWithError()
    }
    // MARK: - IBOutlet connection
    func testIBOutletConnection() {
        guard let mkMapView: MKMapView = stadiumOnMapVC?.mapView as? MKMapView else {fatalError("MKMapView does not exists")}
        XCTAssertNotNil(mkMapView)
    }
    // MARK: - PinAnnotation title test
    func testupdateLocationOnMap() throws {
        let mockLocationData = CLLocation(latitude: 51.5549, longitude: -0.108436)
        let mockPinTitle = "Emirates Stadium"
        self.stadiumOnMapVC?.updateLocationOnMap(to: mockLocationData, with: mockPinTitle)
        XCTAssertNotNil(self.stadiumOnMapVC?.mapView.annotations)
        XCTAssertEqual(self.stadiumOnMapVC?.mapView.annotations.first?.title, "Emirates Stadium")
       
    }

}
