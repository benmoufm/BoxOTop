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
    private let moviesRepository: MoviesRepository

    // MARK: LifeCycle

    init(viewContract: MovieSearchViewContract, moviesRepository: MoviesRepository) {
        self.viewContract = viewContract
        self.moviesRepository = moviesRepository
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - MovieSearchPresenter

    func updateViewModel(with query: String, _ completion: ((Bool) -> Void)?) {
        if query.count < 2 {
            viewContract.displayAlertPopUp(title: "Error", message: "Query too short")
        } else {
            viewContract.displayLoading()
            moviesRepository.getMovies(with: query) { (result) in
                self.viewContract.hideLoading()
                switch result {
                case .value(let data):
                    let viewModel = MovieSearchControllerViewModelMapper(cells: data).map()
                    self.viewContract.configure(with: viewModel)
                    completion?(true)
                case .error(let error):
                    self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
                    completion?(false)
                }
            }
        }
    }

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        moviesRepository.getMovies(with: "Avatar") { (result) in
            switch result {
            case .value(let data):
                let viewModel = MovieSearchControllerViewModelMapper(cells: data).map()
                self.viewContract.configure(with: viewModel)
            case .error(let error):
                self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
