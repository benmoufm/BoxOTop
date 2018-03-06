//
//  MoviesRepositoryImplementation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MoviesRepositoryImplementation: MoviesRepository {

    let httpManager: HttpManager
    var currentSearchQuery: SearchQueryResult? = nil

    init() {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        httpManager = HttpManager(sessionManager: sessionManager)
    }

    func getMovies(with query: String,_ completion: ((Result<SearchQueryResult>) -> Void)?) {
        let httpRequest = HttpRequest(parameters: ["s": query])
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            let searchResult = result.map {
                return try SearchQueryResultMapper(
                    restSearchQueryResult: RestSearchQueryResult(query: query, page: 1, json: $0)
                    ).map()
            }
            if let resultValue = searchResult.value {
                self.currentSearchQuery = resultValue
            }
            completion?(searchResult)
        }
    }

    func getMovies(at page: Int, _ completion: ((Result<SearchQueryResult>) -> Void)?) {
        guard let currentSearchQuery = currentSearchQuery else { return }
        let httpRequest = HttpRequest(parameters: ["s": currentSearchQuery.query, "page": page])
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            let searchResult = result.map { json -> SearchQueryResult in
                let pageResult = try SearchQueryResultMapper(
                    restSearchQueryResult: RestSearchQueryResult(
                        query: currentSearchQuery.query,
                        page: page,
                        json: json
                    )).map()
                var movies = currentSearchQuery.movies
                movies.append(contentsOf: pageResult.movies)
                return SearchQueryResult(
                    movies: movies,
                    total: pageResult.total,
                    query: pageResult.query,
                    currentPage: pageResult.currentPage
                )
            }
            if let resultValue = searchResult.value {
                self.currentSearchQuery = resultValue
            }
            completion?(searchResult)
        }
    }

    func getMovie(by id: String, _ completion: ((Result<MovieDetail>) -> Void)?) {
        let httpRequest = HttpRequest(parameters: ["i": id])
        httpManager.execute(httpRequest: httpRequest) { (result) in
            let movieResult = result.map {
                return try MovieDetailMapper(restMovieDetail: RestMovieDetail(json: $0)).map()
            }
            completion?(movieResult)
        }
    }
}
