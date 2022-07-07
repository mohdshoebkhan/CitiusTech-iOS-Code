//
//  StadiumListViewControllerTests.swift
//  NearByAppTests
//
//  Created by Mohd Shoeb on 07/07/22.
//

import XCTest
@testable import NearByApp
class StadiumListViewControllerTests: XCTestCase {
    var stadiumListVC: StadiumListViewController?
    var tableView: UITableView?
    var dataSource: UITableViewDataSource?
    var delegate: UITableViewDelegate?
    
    // MARK: - setUp Controller Objects
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sut = storyboard.instantiateViewController(identifier: "StadiumListViewController") as? StadiumListViewController else { fatalError("xib does not exists") }
        self.stadiumListVC = sut
        self.stadiumListVC?.loadViewIfNeeded()
        self.stadiumListVC?.viewDidLoad()
        tableView = stadiumListVC?.stadiumListTableView
        guard let ds = tableView?.dataSource else {
            return XCTFail("Controller's table view should have a  data source")
        }
        
        dataSource = ds
        delegate = tableView?.delegate
    }
    // MARK: - Check dequeueReusableCell
    func testTableViewHasCells() {
        let cell = tableView?.dequeueReusableCell(withIdentifier: StadiumTableViewCell.identifier)
        
        XCTAssertNotNil(cell,
                        "TableView should be able to dequeue cell with identifier: 'StadiumTableViewCell'")
    }
    // MARK: - Check DataSourceProtocol
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(((self.stadiumListVC?.conforms(to: UITableViewDataSource.self)) != nil))
        XCTAssertTrue(((self.stadiumListVC?.responds(to: #selector(self.stadiumListVC?.tableView(_:numberOfRowsInSection:)))) != nil))
        XCTAssertTrue(((self.stadiumListVC?.responds(to: #selector(self.stadiumListVC?.tableView(_:cellForRowAt:)))) != nil))
    }
    // MARK: - Check DelegateProtocol
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(((self.stadiumListVC?.conforms(to: UITableViewDelegate.self)) != nil))
        XCTAssertTrue(((self.stadiumListVC?.responds(to: #selector(self.stadiumListVC?.tableView(_:didSelectRowAt:)))) != nil))
    }
    // MARK: - Check Title label text
    func testCellLabelHasTitle() {
        let indexPath0 = IndexPath(item: 0, section: 0)
        let stadiums = self.mockData()
        self.stadiumListVC?.viewModel.stadiumlistArray = stadiums ?? []
        let cell = dataSource?.tableView(tableView ?? UITableView(), cellForRowAt: indexPath0) as? StadiumTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, "Stadium name:- Emirates Stadium", "Cell should have title")
    }
    // MARK: - tearDown Objects
    override func tearDownWithError() throws {
        self.stadiumListVC = nil
        dataSource = nil
        delegate = nil
        tableView = nil
        try super.tearDownWithError()
    }
    // MARK: - Check IBOutlet connection
    func testdefaultTableView() {
        self.stadiumListVC?.defaultTableView()
        XCTAssertEqual(self.stadiumListVC?.stadiumListTableView.backgroundColor, .white)
    }
    func testDidSelectCell() {
        let stadiums = self.mockData()
        self.stadiumListVC?.viewModel.stadiumlistArray = stadiums ?? []
        self.stadiumListVC?.tableView(self.stadiumListVC?.stadiumListTableView ?? UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
    }
    // MARK: - Check Tableview Object
    func testReloadTableCellData() throws {
        self.stadiumListVC?.reloadTableCellData()
        XCTAssertNotNil(self.stadiumListVC?.stadiumListTableView)
    }
    // MARK: - cellForRowAt Test case
    func testCellForRow() {
        let tableView = self.stadiumListVC?.stadiumListTableView ?? UITableView()
        let indexPath0 = IndexPath(item: 0, section: 0)
        let stadiums = self.mockData()
        self.stadiumListVC?.viewModel.stadiumlistArray = stadiums ?? []
        let actualCell = dataSource?.tableView(tableView, cellForRowAt: indexPath0) as? StadiumTableViewCell
        let visibleRows = tableView.indexPathsForVisibleRows
        XCTAssertNotNil(actualCell)
        XCTAssert(visibleRows != nil)
        XCTAssert(tableView.indexPathsForVisibleRows!.contains(indexPath0))
    }
    // MARK: - NumberOfRows Test case
    func testtestNumberOfRows() {
        let stadiums = self.mockData()
        self.stadiumListVC?.viewModel.stadiumlistArray = stadiums ?? []
        let numberOfRows = dataSource?.tableView(tableView ?? UITableView(), numberOfRowsInSection: stadiums?.count ?? 0)
        XCTAssertEqual(numberOfRows, 1,
                       "Number of rows in table should match number of stadiums count")
    }
    // MARK: - Mock Data
    func mockData() ->[Stadium]? {
        let stadiums = [Stadium(name: "Emirates Stadium", desc: "The Emirates Stadium is a football stadium in Holloway, London, England. It is the home of Arsenal FC, since its completion in 2006. It has a current seated capacity of 60,704, making it the fourth-largest football stadium in England.", lattitude: 51.5549, longtitude: -0.108436)]
        return stadiums
    }
    
}
