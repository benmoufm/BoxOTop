//
//  MovieSearchViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 26/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, MovieSearchViewContract {

    var presenter: MovieSearchPresenter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }

    // MARK: - MovieSearchViewContract

    func configure(with viewModel: MovieSearchControllerViewModel) {
        // TODO: (Mélodie Benmouffek) Configure with view model
    }
}
