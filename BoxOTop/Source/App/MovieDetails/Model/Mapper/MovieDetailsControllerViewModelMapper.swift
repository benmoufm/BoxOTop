//
//  MovieDetailsControllerViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieDetailsControllerViewModelMapper {
    let title: String
    let posterURL: URL?
    let releaseDate: String
    let genre: String
    let runtime: String
    let ratings: [Rating]
    let myReview: Review?
    let synopsis: String
    let director: String
    let casting: String

    func map() -> MovieDetailsControllerViewModel {
        return MovieDetailsControllerViewModel(
            title: title,
            posterURL: posterURL,
            releaseDate: releaseDate,
            director: director,
            genre: genre,
            runtime: runtime,
            ratings: MovieDetailsCollectionViewModelMapper(cells: ratings, myReview: myReview).map(),
            synopsis: synopsis,
            casting: casting
        )
    }
}
