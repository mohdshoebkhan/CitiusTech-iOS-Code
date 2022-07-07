//
//  MoviesEndPoint.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 06/07/22.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum MoviesApi {
    case movieList
}
extension MoviesApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://howtodoandroid.com/"
        case .qa: return "https://howtodoandroid.com/"
        case .staging: return "https://howtodoandroid.com/"
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    var path: String {
        switch self {
        case .movieList:
            return "movielist.json"
        
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .movieList:
            return .get
        }
        
    }
    
    var task: HTTPTask {
        switch self {
        case .movieList:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }

}
