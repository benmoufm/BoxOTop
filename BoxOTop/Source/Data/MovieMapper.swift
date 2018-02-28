//
//  MovieMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieMapper {
    let restMovie: RestMovie

    func map() -> Movie {
        return Movie(
            id: restMovie.id,
            posterURL: restMovie.posterURL,
            title: restMovie.title,
            year: restMovie.year
        )
    }
}
