//
//  StadiumViewModelTests.swift
//  NearByAppTests
//
//  Created by Mohd Shoeb on 07/07/22.
//

import XCTest
@testable import NearByApp
class StadiumViewModelTests: XCTestCase {
    var stadiumViewModel: StadiumViewModel?
    
    // MARK: - setUp ViewModel Objects
    override func setUpWithError() throws {
        stadiumViewModel = StadiumViewModel()
    }
    // MARK: - TearDown ViewModel Objects
    override func tearDownWithError() throws {
        stadiumViewModel = nil
        try super.tearDownWithError()
    }
    // MARK: - Mock Data
    func mockData() -> [Stadium]? {
        let stadiumsArray = [Stadium(name: "Emirates Stadium", desc: "The Emirates Stadium is a football stadium in Holloway, London, England. It is the home of Arsenal FC, since its completion in 2006. It has a current seated capacity of 60,704, making it the fourth-largest football stadium in England.", lattitude: 51.5549, longtitude: -0.108436), Stadium(name: "Stamford Bridge", desc: "Exhibition of the iconic soccer club’s trophies, shirts & memorabilia, plus tours of their stadium.", lattitude: 51.4816, longtitude: -0.191034)]
        return stadiumsArray
    }
    // MARK: - Model object property
    func testGetCellViewModel() throws {
        let indexPath0 = IndexPath(item: 0, section: 0)
        let stadiumModel = self.stadiumViewModel?.getCellViewModel(at: indexPath0)
        XCTAssertEqual(stadiumModel?.name, "Emirates Stadium", "Model should have name attribute")
    }



}
