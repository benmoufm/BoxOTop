//
//  MovieDetailsCellViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct RatingCellViewModelMapper {
    let rating: Rating

    func map() -> RatingCellViewModel {
        return RatingCellViewModel(
            ratingSource: rating.source,
            stars: StarRaterViewModelMapper(starNumber: 5, rating: rating.value).map()
        )
    }
}
