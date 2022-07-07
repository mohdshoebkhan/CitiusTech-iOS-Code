//
//  ViewController.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var backendApiFlowButton: UIButton!
    @IBOutlet weak var dummyDataFlowButton: UIButton!
    private var locationServiceManager: LocationServiceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.setButtonCornerRadius()
        self.getCurrentLocation()
    }
   
    // MARK: - Button Corner Radius
    func setButtonCornerRadius() {
        backendApiFlowButton.layer.cornerRadius = backendApiFlowButton.frame.size.height / 2
        dummyDataFlowButton.layer.cornerRadius = dummyDataFlowButton.frame.size.height / 2
    }
    // MARK: - Get Current Location
    func getCurrentLocation() {
        locationServiceManager = LocationServiceManager()
        locationServiceManager?.setup(permissionDenied: {
            print("Not given location permission")
            self.showLocationPermisionAlert()
        }, locationRetrieved: { location in
            print("location permission given")
            print(location)
//            let dummyLocation = RandomLocations().getMockLocationsFor(location: location, itemCount: 5)
//            print(dummyLocation)
        })
    }


}
// MARK: - Show Location Blocked Alert
extension ViewController {
    func showLocationPermisionAlert() {
            let alertController = UIAlertController(title: "Location Permission Required", message: "Please enable location permissions in settings.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Settings", style: .default, handler: {(cAlertAction) in
                //Redirect to Settings app
                UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - NavigationBar UI
extension ViewController {
    func setNavigationBar() {
        title = "Choose option "
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.black]
        
        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
