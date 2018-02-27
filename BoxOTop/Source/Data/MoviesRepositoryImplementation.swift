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

    func getMovies(with query: String,_ completion: ((Result<[Movie]>) -> Void)?) {
        let httpRequest = HttpRequest(parameters: ["s":query])
        httpManager.execute(httpRequest: httpRequest) { result -> Void in

        }
    }
}
