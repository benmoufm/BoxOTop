//
//  MovieDetailsPresenterImplementation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class MovieDetailsPresenterImplementation: MovieDetailsPresenter {
    var delegate: MovieDetailsPresenterDelegate?

    // MARK: - Private properties

    private unowned let viewContract: MovieDetailsViewContract
    private let moviesRepository: MoviesRepository
    private let dataRepository: DataRepository
    private let movieId: String

    // MARK: - Lifecycle

    init(viewContract: MovieDetailsViewContract, moviesRepository: MoviesRepository, dataRepository: DataRepository, id: String) {
        self.viewContract = viewContract
        self.moviesRepository = moviesRepository
        self.dataRepository = dataRepository
        self.movieId = id
    }

    // MARK: - Startable

    func start() {
        computeAndDisplay()
    }

    // MARK: - MovieDetailsPresenter

    func addMyRating() {
        delegate?.movieDetailsPresenter(self)
    }

    func reload() {
        computeAndDisplay()
    }

    // MARK: - Private methods

    private func computeAndDisplay() {
        viewContract.displayLoading()
        dataRepository.fetch(with: movieId) { (result) in
            switch result {
            case . value(let review):
                self.moviesRepository.getMovie(by: self.movieId) { (result) in
                    self.viewContract.hideLoading()
                    switch result {
                    case .value(let movie):
                        let viewModel = MovieDetailsControllerViewModelMapper(
                            title: movie.title,
                            posterURL: movie.posterURL,
                            releaseDate: movie.releaseDate,
                            genre: movie.genre,
                            runtime: movie.runtime,
                            ratings: movie.ratings,
                            myReview: review,
                            synopsis: movie.synopsis,
                            director: movie.director,
                            casting: movie.casting
                            ).map()
                        self.viewContract.configure(with: viewModel)
                    case .error(let error):
                        self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
                    }
                }
            case .error(let error):
                self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
            }
        }
    }

}
