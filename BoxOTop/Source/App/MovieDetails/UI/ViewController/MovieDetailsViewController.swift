//
//  MovieDetailsViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController, MovieDetailsViewContract {

    var presenter: MovieDetailsPresenter?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - MovieDetailsViewContract

    func configure(with viewModel: MovieDetailsControllerViewModel) {
        // TODO (Mélodie Benmouffek) 01/03/2018 Configure with view model
    }

    // MARK: - Private methods

    private func setup() {
        // TODO (Mélodie Benmouffek) 01/03/2018 setup private properties
    }

}
