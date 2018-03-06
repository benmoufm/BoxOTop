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
    let posterURL: URL?
    let title: String
    let year: String

    init(id: String, posterURL: URL?, title: String, year: String) {
        self.id = id
        self.posterURL = posterURL
        self.title = title
        self.year = year
    }
}
