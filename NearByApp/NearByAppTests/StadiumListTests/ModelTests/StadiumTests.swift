//
//  StadiumTests.swift
//  NearByAppTests
//
//  Created by Mohd Shoeb on 07/07/22.
//

import XCTest
@testable import NearByApp
class StadiumTests: XCTestCase {
    // MARK: - Mock Data
    func mockData() -> Stadium? {
        return Stadium(name: "Emirates Stadium", desc: "The Emirates Stadium is a football stadium in Holloway, London, England. It is the home of Arsenal FC, since its completion in 2006. It has a current seated capacity of 60,704, making it the fourth-largest football stadium in England.", lattitude: 51.5549, longtitude: -0.108436)
    }
    // MARK: - Model Name test
    func testName() throws {
        let stadium = self.mockData()
        XCTAssertEqual(stadium?.name, "Emirates Stadium",
                       "Stadium name should be set in initializer")
    }
    // MARK: - Model Name lattitude
    func testLocationLat() throws {
        let stadium = self.mockData()
        XCTAssertEqual(stadium?.lattitude, 51.5549,
                       "Stadium lattitude should be set in initializer")
    }
    // MARK: - Model Name longtitude
    func testLocationLong() throws {
        let stadium = self.mockData()
        XCTAssertEqual(stadium?.longtitude, -0.108436,
                       "Stadium longtitude should be set in initializer")
    }
    // MARK: - Model Name Description
    func testStadiumDescription() throws {
        let expectedResult = "The Emirates Stadium is a football stadium in Holloway, London, England. It is the home of Arsenal FC, since its completion in 2006. It has a current seated capacity of 60,704, making it the fourth-largest football stadium in England."
        let stadium = self.mockData()
        XCTAssertEqual(stadium?.desc, expectedResult,
                       "Stadium Description should be set in initializer")
    }

}
