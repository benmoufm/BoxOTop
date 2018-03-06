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
    private(set) lazy var moviesRepository: MoviesRepository = MoviesRepositoryImplementation()
    private(set) lazy var dataRepository: DataRepository = DataRepositoryImplementation()
}
