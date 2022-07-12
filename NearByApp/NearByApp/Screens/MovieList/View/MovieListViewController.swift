//
//  MovieListViewController.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import UIKit
import CoreLocation

class MovieListViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    var currentLocation: CLLocation?
    
    lazy var viewModel = {
        MovieViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Movie List"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.setErrorLabelText(error: "")
           self.initTableView()
        self.initViewModel()
    }
    // MARK: - Table UI Initiliaze
    func initTableView() {
        movieListTableView.backgroundColor = .white
        movieListTableView.separatorColor = .white
        movieListTableView.separatorStyle = .singleLine
        movieListTableView.tableFooterView = UIView()
        movieListTableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        movieListTableView.estimatedRowHeight = 90
        movieListTableView.rowHeight = UITableView.automaticDimension
    }
    deinit {
        print("controller getting remove from memory\(self)")
    }
    // MARK: - Get Call Movie List API
    func initViewModel() {
        LoadingView.show()
        viewModel.getMovieList { [weak self] error, movieResponse in
            LoadingView.hide()
            DispatchQueue.main.async {
                if error != nil {
                    print(error ?? "")
                    self?.setErrorLabelText(isHidden: false, error: error)
                } else {
                    self?.setErrorLabelText(error: "")
                    RandomLocations().getMockLocationsFor(location: self?.currentLocation, movieArray: movieResponse) { error, movieArray in
                        self?.viewModel.movieListArray = movieArray
                        self?.movieListTableView.reloadData()
                    }
                }
            }
        }
    }
    // MARK: - Set Error Message
    func setErrorLabelText(isHidden: Bool = true, error: String?) {
        errorLabel.text = error ?? ""
        errorLabel.isHidden = isHidden
        movieListTableView.isHidden = !isHidden
    }
}

// MARK: - UITableViewDelegate
extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.getMovieModelForCell(with: indexPath.row)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let coffeeShopMap = storyBoard.instantiateViewController(withIdentifier: "StadiumOnMapViewController") as! StadiumOnMapViewController
        coffeeShopMap.movieModel = cellViewModel
        navigationController?.pushViewController(coffeeShopMap, animated: true);
    }
}

// MARK: - UITableViewDataSource
extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.movieCount ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { fatalError("xib does not exists") }
        let cellViewModel = viewModel.getMovieModelForCell(with: indexPath.row)
        cell.cellViewModel = cellViewModel
        return cell
    }
}

