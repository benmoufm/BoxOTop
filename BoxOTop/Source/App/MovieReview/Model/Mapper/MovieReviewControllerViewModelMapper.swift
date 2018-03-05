//
//  MovieReviewControllerViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieReviewControllerViewModelMapper {
    let currentRating: Int

    func map() -> MovieReviewControllerViewModel {
        return MovieReviewControllerViewModel(
            title: "movie_review_title_text".localized,
            ratingLabel: "movie_review_rating_label_text".localized,
            currentRating: currentRating,
            cancelButtonTitle: "movie_review_cancel_button_text".localized,
            submitButtonTitle: "movie_review_submit_button_text".localized
        )
    }
}
