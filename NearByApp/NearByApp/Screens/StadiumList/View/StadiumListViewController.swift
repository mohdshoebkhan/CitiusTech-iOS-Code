//
//  StadiumListViewController.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import UIKit

class StadiumListViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var stadiumListTableView: UITableView!
    lazy var viewModel = {
        StadiumViewModel()
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Nearby Stadium List"
        self.defaultTableView()
        reloadTableCellData()
        
    }
    // MARK: - Table UI Initiliaze
    func defaultTableView() {
        stadiumListTableView.backgroundColor = .white
        stadiumListTableView.separatorStyle = .singleLine
        stadiumListTableView.tableFooterView = UIView()
        stadiumListTableView.register(StadiumTableViewCell.nib, forCellReuseIdentifier: StadiumTableViewCell.identifier)
        stadiumListTableView.estimatedRowHeight = 90
        stadiumListTableView.rowHeight = UITableView.automaticDimension
    }
    // MARK: - Reload Tableview
    func reloadTableCellData() {
        // Reload TableView closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.stadiumListTableView.reloadData()
            }
        }
    }
}
// MARK: - UITableViewDelegate
extension StadiumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let coffeeShopMap = storyBoard.instantiateViewController(withIdentifier: "StadiumOnMapViewController") as! StadiumOnMapViewController
        coffeeShopMap.stadiumModel = cellVM
        navigationController?.pushViewController(coffeeShopMap, animated: true);
    }
}
// MARK: - UITableViewDataSource
extension StadiumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.stadiumlistArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StadiumTableViewCell.identifier, for: indexPath) as? StadiumTableViewCell else { fatalError("xib does not exists") }
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellVM
        return cell
    }
   
}

