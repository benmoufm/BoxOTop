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
        moviesRepository.getMovie(by: movieId) { (result) in
            switch result {
            case .value(let movie):
                let viewModel = MovieDetailsControllerViewModelMapper(
                    title: movie.title,
                    posterURL: movie.posterURL,
                    releaseDate: movie.releaseDate,
                    genre: movie.genre,
                    runtime: movie.runtime,
                    ratings: movie.ratings,
                    synopsis: movie.synopsis,
                    director: movie.director,
                    casting: movie.casting
                ).map()
                self.viewContract.configure(with: viewModel)
            case .error(let error):
                self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
            }
        }
    }

}
