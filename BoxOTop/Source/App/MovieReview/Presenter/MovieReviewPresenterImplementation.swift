//
//  MovieReviewPresenterImplementation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

class MovieReviewPresenterImplementation: MovieReviewPresenter {
    private unowned let viewContract: MovieReviewViewContract
    weak var delegate: MovieReviewPresenterDelegate?
    private var currentRating: Int = 0

    // MARK: LifeCycle

    init(viewContract: MovieReviewViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - Startable

    func start() {
        computeAndDisplayViewModel()
    }

    // MARK: - MovieReviewPresenter

    func dismissSubmitReview() {
        delegate?.movieReviewPresenter(self)
    }

    func updateRating(rating: Float) {
        currentRating = Int(floorf(rating))
        computeAndDisplayViewModel()
    }

    // MARK: - Private methods

    private func computeAndDisplayViewModel() {
        let viewModel = MovieReviewControllerViewModelMapper(currentRating: currentRating).map()
        viewContract.configure(with: viewModel)
    }
}
