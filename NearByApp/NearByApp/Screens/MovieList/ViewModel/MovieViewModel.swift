//
//  MovieViewModel.swift
//  NearByApp
//
//  Created by Mohd Shoeb on 06/07/22.
//

import Foundation

class MovieViewModel {
    private let networkManager: NetworkServiceManagerProtocol?
    private var movieListArray:[Movie]?
    
    init(networkManager: NetworkServiceManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    var movieCount:Int? {
        return movieListArray?.count
    }
    func getMovieCategoryName(with index:Int) -> String? {
        return movieListArray?[index].category
    }
    
    func getMovieModelForCell(with index:Int) -> Movie? {
        return movieListArray?[index]
    }
    
}
extension MovieViewModel {
    func getMovieList(callBack:@escaping APICallBack) {
        self.networkManager?.getAPI(decodabel: MovieResponse.self, movieApi: .movieList, completion: { response, error in
            if error != nil {
                callBack(error)
            }else {
                self.movieListArray = response?.movies
                callBack(nil)
            }
        })
    }
}
