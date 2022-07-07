//
//  EndPoint.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 05/07/22.

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

