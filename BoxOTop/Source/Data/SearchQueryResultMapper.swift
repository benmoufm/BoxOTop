//
//  SearchQueryResultMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct SearchQueryResultMapper {
    let restSearchQueryResult: RestSearchQueryResult

    func map() -> SearchQueryResult {
        return SearchQueryResult(
            movies: restSearchQueryResult.movies.map { MovieMapper(restMovie: $0).map() },
            total: restSearchQueryResult.totalResults,
            query: restSearchQueryResult.query,
            currentPage: restSearchQueryResult.currentPage
        )
    }
}
