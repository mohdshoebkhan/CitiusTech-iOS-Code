//
//  StadiumTableViewCellTests.swift
//  NearByAppTests
//
//  Created by Mohd Shoeb on 07/07/22.
//

import XCTest
@testable import NearByApp
class StadiumTableViewCellTests: XCTestCase {

    var stadiumTableViewCell: StadiumTableViewCell?
    override func setUpWithError() throws {
        guard  let tableCell = Bundle(for: StadiumTableViewCell.self).loadNibNamed("StadiumTableViewCell", owner: nil)?.first as? StadiumTableViewCell else { fatalError("xib does not exists") }
        self.stadiumTableViewCell = tableCell
        self.stadiumTableViewCell?.awakeFromNib()
    }

    override func tearDownWithError() throws {
        stadiumTableViewCell = nil
        try super.tearDownWithError()
    }
    func testIBOutletConnection() {
        guard let titleLabel: UILabel = stadiumTableViewCell?.titleLabel as? UILabel else {fatalError("UIlabel does not exists")}
       guard let subTitleLabel: UILabel = stadiumTableViewCell?.subTitleLabel as? UILabel else {fatalError("UIlabel does not exists")}
        guard let arrowImageView: UIImageView = stadiumTableViewCell?.arrowImageView as? UIImageView else {fatalError("UIImageView does not exists")}
        XCTAssertNotNil(titleLabel)
        XCTAssertNotNil(subTitleLabel)
        XCTAssertNotNil(arrowImageView)
        
    }
   func testInitView() {
       self.stadiumTableViewCell?.initView()
       self.stadiumTableViewCell?.cellViewModel = self.mockData()
       XCTAssertTrue(((self.stadiumTableViewCell?.cellViewModel?.name) != nil), "Emirates Stadium")
    }
    func mockData() -> Stadium? {
        return Stadium(name: "Emirates Stadium", desc: "The Emirates Stadium is a football stadium in Holloway, London, England. It is the home of Arsenal FC, since its completion in 2006. It has a current seated capacity of 60,704, making it the fourth-largest football stadium in England.", lattitude: 51.5549, longtitude: -0.108436)
    }

}
