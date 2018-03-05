//
//  MainCoordinator.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator, MovieSearchPresenterDelegate, MovieDetailsPresenterDelegate {

    let window: UIWindow
    let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = SharedNavigationController()
    }

    func start() {
        let movieSearchViewController = ViewControllerFactory.instance.movieSearchViewController(presenterDelegate: self)
        navigationController.pushViewController(movieSearchViewController, animated: false)
        window.rootViewController = navigationController
    }

    // MARK: - MovieSearchPresenterDelegate

    func movieSearchPresenter(_ presenter: MovieSearchPresenter, id: String) {
        let movieDetailsViewController = ViewControllerFactory.instance.movieDetailsViewController(id: id, presenterDelegate: self)
        navigationController.pushViewController(movieDetailsViewController, animated: true)
    }

    // MARK: - MovieDetailsPresenterDelegate

    func movieDetailsPresenter(_ presenter: MovieDetailsPresenter) {
        let movieReviewViewController = ViewControllerFactory.instance.movieReviewViewController()
        movieReviewViewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(movieReviewViewController, animated: true)
    }
}
