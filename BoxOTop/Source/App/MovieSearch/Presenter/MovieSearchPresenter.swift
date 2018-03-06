//
//  MovieSearchPresenter.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieSearchPresenterDelegate: class {
    func movieSearchPresenter(_ presenter: MovieSearchPresenter, id: String)
}

protocol MovieSearchPresenter: Startable {
    var delegate: MovieSearchPresenterDelegate? { get }
    func searchMovies(with query: String)
    func loadMoreCells()
    func didSelectMovieCell(with id: String)
}
