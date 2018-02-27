//
//  MovieSearchPresenterImplementation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class MovieSearchPresenterImplementation: MovieSearchPresenter {
    private unowned let viewContract: MovieSearchViewContract

    // MARK: LifeCycle

    init(viewContract: MovieSearchViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - MovieSearchPresenter

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        let viewModel = MovieSearchControllerViewModelMapper(cells: []).map()
        viewContract.configure(with: viewModel)
    }
}
