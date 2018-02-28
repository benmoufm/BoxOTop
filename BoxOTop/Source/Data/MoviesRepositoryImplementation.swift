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

    init() {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        httpManager = HttpManager(sessionManager: sessionManager)
    }

    func getMovies(with query: String,_ completion: ((Result<SearchQueryResult>) -> Void)?) {
        let httpRequest = HttpRequest(parameters: ["s":query])
        httpManager.execute(httpRequest: httpRequest) { result -> Void in
            let searchResult = result.map {
                return try SearchQueryResultMapper(
                    restSearchQueryResult: RestSearchQueryResult(query: query, json: $0)
                    ).map()
            }
            completion?(searchResult)
        }
    }
}
