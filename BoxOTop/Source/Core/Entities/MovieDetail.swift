//
//  MovieDetail.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieDetail {
    let id: String
    let title: String
    let posterURL: URL?
    let releaseDate: String
    let director: String
    let genre: String
    let runtime: String
    let ratings: [Rating]
    let synopsis: String
    let casting: String

    init(
        id: String,
        title: String,
        posterURL: URL?,
        releaseDate: String,
        director: String,
        genre: String,
        runtime: String,
        ratings: [Rating],
        synopsis: String,
        casting: String
        ) {
        self.id = id
        self.title = title
        self.posterURL = posterURL
        self.releaseDate = releaseDate
        self.ratings = ratings
        self.director = director
        self.synopsis = synopsis
        self.casting = casting
        self.genre = genre
        self.runtime = runtime
    }
}
