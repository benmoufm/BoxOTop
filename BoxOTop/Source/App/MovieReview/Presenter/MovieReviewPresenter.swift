//
//  MovieReviewPresenter.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieReviewPresenterDelegate: class {
    func movieReviewPresenter(_ presenter: MovieReviewPresenter)
}

protocol MovieReviewPresenter: Startable {
    func dismissSubmitReview()
    func updateRating(rating: Float)
}
