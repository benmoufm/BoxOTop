//
//  ViewControllerFactory.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

final class ViewControllerFactory {
    static let instance = ViewControllerFactory()

    private init() {}

    func movieSearchViewController(presenterDelegate: MovieSearchPresenterDelegate) -> MovieSearchViewController {
        let movieSearchViewController = MovieSearchViewController()
        let presenter = MovieSearchPresenterImplementation(
            viewContract: movieSearchViewController,
            moviesRepository: RepositoryFactory.instance.moviesRepository
        )
        presenter.delegate = presenterDelegate
        movieSearchViewController.presenter = presenter
        return movieSearchViewController
    }

    func movieDetailsViewController(id: String, presenterDelegate: MovieDetailsPresenterDelegate) -> MovieDetailsViewController {
        let movieDetailsViewController = MovieDetailsViewController()
        let presenter = MovieDetailsPresenterImplementation(
            viewContract: movieDetailsViewController,
            moviesRepository: RepositoryFactory.instance.moviesRepository,
            dataRepository: RepositoryFactory.instance.dataRepository,
            id: id
        )
        presenter.delegate = presenterDelegate
        movieDetailsViewController.presenter = presenter
        return movieDetailsViewController
    }

    func movieReviewViewController() -> MovieReviewViewController {
        let movieReviewViewController = MovieReviewViewController()
        let presenter = MovieReviewPresenterImplementation(viewContract: movieReviewViewController)
        movieReviewViewController.presenter = presenter
        return movieReviewViewController
    }
}
