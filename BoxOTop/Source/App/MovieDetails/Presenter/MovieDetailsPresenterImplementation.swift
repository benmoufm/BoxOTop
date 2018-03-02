//
//  MovieDetailsPresenterImplementation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class MovieDetailsPresenterImplementation: MovieDetailsPresenter {

    // MARK: - Private properties

    private unowned let viewContract: MovieDetailsViewContract
    private let moviesRepository: MoviesRepository
    private let movieId: String

    // MARK: - Lifecycle

    init(viewContract: MovieDetailsViewContract, moviesRepository: MoviesRepository, id: String) {
        self.viewContract = viewContract
        self.moviesRepository = moviesRepository
        self.movieId = id
    }

    // MARK: - Startable

    func start() {
        computeAndDisplay()
    }

    // MARK: - Private methods

    private func computeAndDisplay() {
        // TODO (Mélodie Benmouffek) 01/03/2018 configure view contract with view model
    }

}
