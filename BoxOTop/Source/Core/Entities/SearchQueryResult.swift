//
//  SearchQueryResult.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct SearchQueryResult {
    let movies: [Movie]
    let total: Int
    let query: String
    let currentPage: Int
}
