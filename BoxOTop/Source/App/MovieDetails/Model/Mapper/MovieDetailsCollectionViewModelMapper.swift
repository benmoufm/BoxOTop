//
//  MovieDetailsCollectionViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieDetailsCollectionViewModelMapper {
    let cells: [Rating]
    let myReview: Review?

    func map() -> MovieDetailsCollectionViewModel {
        var movieDetailsCellViewModel: [MovieDetailsCellViewModel] = cells.map {
            return .ratingCell(RatingCellViewModelMapper(rating: $0).map())
        }
        if let myRating = myReview {
            movieDetailsCellViewModel.append(.ratingCell(RatingCellViewModelMapper(
                rating: Rating(
                    source: "movie_details_my_rating_source_text".localized,
                    value: myRating.movieRating)).map()
                )
            )
        } else {
            movieDetailsCellViewModel.append(.plusCell(PlusCellViewModelMapper().map()))
        }
        return MovieDetailsCollectionViewModel(cells: movieDetailsCellViewModel)
    }
}
