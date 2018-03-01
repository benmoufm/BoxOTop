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
    private var searchQuery: SearchQueryResult?
    var delegate: MovieSearchPresenterDelegate? = nil

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

    func searchMovies(with query: String) {
        if query.count < 2 {
            viewContract.displayAlertPopUp(title: "Error", message: "Query too short")
        } else {
            viewContract.displayLoading()
            moviesRepository.getMovies(with: query) { (result) in
                self.viewContract.hideLoading()
                switch result {
                case .value(let data):
                    self.searchQuery = data
                    self.computeAndDisplayViewModel()
                    self.viewContract.scrollWhenNewQuery()
                case .error(let error):
                    self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
                }
            }
        }
    }

    func loadMoreCells() {
        guard let searchQuery = searchQuery else { return }
        moviesRepository.getMovies(at: searchQuery.currentPage+1) { (result) in
            switch result {
            case .value(let data):
                self.searchQuery = data
                self.computeAndDisplayViewModel()
                self.viewContract.reloadTableView()
            case .error(let error):
                self.viewContract.displayAlertPopUp(title: "Error", message: error.localizedDescription)
            }
        }
    }

    func didSelectMovieCell() {
        delegate?.movieSearchPresenter(self)
    }

    // MARK: - private methods

    private func computeAndDisplayViewModel() {
        guard let searchQuery = searchQuery else { return }
        let viewModel = MovieSearchControllerViewModelMapper(cells: searchQuery.movies, totalResults: searchQuery.total).map()
        self.viewContract.configure(with: viewModel)
    }
}
