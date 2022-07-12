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
        self.navigationItem.title = "Choose option"
      //  self.navigationController?.setNavigationBar(title: "Choose option ")
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
        })
    }
    @IBAction func backendAPIFlowButtonTapped(_ sender: UIButton) {
        if locationServiceManager?.currentLocation != nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let movieListVC = storyBoard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController else {return}
            movieListVC.currentLocation = locationServiceManager?.currentLocation
            navigationController?.pushViewController(movieListVC, animated: true);
        } else {
            self.showLocationPermisionAlert()
        }
    }


}
// MARK: - Show Location Blocked Alert
extension UIViewController {
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
