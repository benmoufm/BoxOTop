//
//  MoviesRepository.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MoviesRepository {
    func getMovies(with query: String,_ completion: ((Result<SearchQueryResult>) -> Void)?)
    func getMovies(at page: Int,_ completion: ((Result<SearchQueryResult>) -> Void)?)
}
