//
//  StadiumViewModel.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.
//

import Foundation

class StadiumViewModel: NSObject {
    // MARK: - closure
    var reloadTableView: (() -> Void)?
    
    // MARK: - Property Observer
    var stadiumlistArray = [Stadium]() {
        didSet {
            reloadTableView?()
        }
    }
    
    override init() {
        super.init()
        stadiumlistArray = self.getStadiumDetails() ?? []
    }
    // MARK: - Get TableCell Model
    func getCellViewModel(at indexPath: IndexPath) -> Stadium? {
        return stadiumlistArray[indexPath.row]
    }
    
}
// MARK: - Dummy data
extension StadiumViewModel {
    func getStadiumDetails() ->[Stadium]? {
        let stadiumsArray = [Stadium(name: "Emirates Stadium", desc: "The Emirates Stadium is a football stadium in Holloway, London, England. It is the home of Arsenal FC, since its completion in 2006. It has a current seated capacity of 60,704, making it the fourth-largest football stadium in England.", lattitude: 51.5549, longtitude: -0.108436), Stadium(name: "Stamford Bridge", desc: "Exhibition of the iconic soccer club’s trophies, shirts & memorabilia, plus tours of their stadium.", lattitude: 51.4816, longtitude: -0.191034),Stadium(name: "White Hart Lane", desc: "Tottenham Hotspur Stadium is the home of Premier League club Tottenham Hotspur in north London, replacing the club's previous ground, White Hart Lane.", lattitude: 51.6033, longtitude: -0.065684), Stadium(name: "Olympic Stadium", desc: "The Olympic Stadium is a sporting venue which was used as the main stadium for the 1928 Summer Olympics in Amsterdam. The venue is currently used mostly for athletics, other sports events and concerts. When completed, the stadium had a capacity of 31,600.", lattitude: 51.5383, longtitude: -0.016587),Stadium(name: "Old Trafford", desc: "Old Trafford is a football stadium in Old Trafford, Greater Manchester, England, and the home of Manchester United. With a capacity of 74,140 seats, it is the largest club football stadium in the United Kingdom, and the eleventh-largest in Europe", lattitude: 53.4631, longtitude: -2.29139), Stadium(name: "Anfield", desc: "Anfield is a football stadium in Anfield, Liverpool, Merseyside, England, which has a seating capacity of 53,394, making it the seventh largest football stadium in England. It has been the home of Liverpool F.C. since their formation in 1892.", lattitude: 53.4308, longtitude: -2.96096)]
        return stadiumsArray
    }
}
