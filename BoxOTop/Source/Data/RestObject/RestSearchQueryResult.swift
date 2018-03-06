//
//  RestSearchQueryResult.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestSearchQueryResult {
    let query: String
    let currentPage: Int
    let totalResults: Int
    let movies: [RestMovie]

    init(query: String, page: Int, json: JSON) throws {
        guard let totalResultsString = json["totalResults"].string,
            let totalResults = Int(totalResultsString),
            let jsonMovies = json["Search"].array
            else { throw CustomErrors.unexpectedJSONFormat }
        let restMovies = try jsonMovies.map { try RestMovie(json: $0) }
        self.query = query
        self.currentPage = page
        self.totalResults = totalResults
        self.movies = restMovies
    }
}
