//
//  RepositoryFactory.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

final class RepositoryFactory {

    static let instance = RepositoryFactory()

    func moviesRepository() -> MoviesRepository {
        return MoviesRepositoryImplementation()
    }
}
