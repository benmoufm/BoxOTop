//
//  MovieDetailMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieDetailMapper {
    let restMovieDetail: RestMovieDetail

    func map() -> MovieDetail {
        return MovieDetail(
            id: restMovieDetail.id,
            title: restMovieDetail.title,
            posterURL: restMovieDetail.posterURL,
            releaseDate: restMovieDetail.releaseDate,
            director: restMovieDetail.director,
            genre: restMovieDetail.genre,
            runtime: restMovieDetail.runtime,
            ratings: restMovieDetail.ratings.map { RatingMapper(restRating: $0).map() },
            synopsis: restMovieDetail.synopsis,
            casting: restMovieDetail.casting
        )
    }
}
