//
//  Movie.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct Movie {
    let id: String
    let posterURL: String
    let title: String
    let year: String

    init(id: String, posterURL: String, title: String, year: String) {
        self.id = id
        self.posterURL = posterURL
        self.title = title
        self.year = year
    }
}
