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

    // MARK: - Lifecycle

    init(viewContract: MovieDetailsViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplay()
    }

    // MARK: - Private methods

    private func computeAndDisplay() {
        // TODO (Mélodie Benmouffek) 01/03/2018 configure view contract with view model
    }

}
