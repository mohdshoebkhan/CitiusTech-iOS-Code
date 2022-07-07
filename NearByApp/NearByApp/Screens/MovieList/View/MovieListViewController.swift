//
//  MovieListViewController.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import UIKit

class MovieListViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    lazy var viewModel = {
        MovieViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.setErrorLabelText(error: "")
        //   self.initTableView()
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
    // MARK: - Get Call Movie List API
    func initViewModel() {
        viewModel.getMovieList { [weak self] error in
            DispatchQueue.main.async {
                if error != nil {
                    print(error ?? "")
                    self?.setErrorLabelText(isHidden: false, error: error)
                } else {
                    self?.setErrorLabelText(error: "")
                    self?.movieListTableView.reloadData()
                }
            }
        }
    }
    // MARK: - Set Error Message
    func setErrorLabelText(isHidden: Bool = true, error: String?) {
        errorLabel.text = error ?? ""
        errorLabel.isHidden = isHidden
       // movieListTableView.isHidden = !isHidden
    }
}

// MARK: - UITableViewDelegate
extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.getMovieModelForCell(with: indexPath.row)
        print(cellViewModel ?? Movie())
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
// MARK: - NavigationBar UI
extension MovieListViewController {
    func setNavigationBar() {
        title = "Movies List "
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

