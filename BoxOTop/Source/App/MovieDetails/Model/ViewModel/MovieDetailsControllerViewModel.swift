//
//  MovieDetailsControllerViewModel.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieDetailsControllerViewModel {
    let title: String
    let posterURL: URL?
    let releaseDate: String
    let director: String
    let genre: String
    let runtime: String
    let ratings: MovieDetailsCollectionViewModel
    let synopsis: String
    let casting: String
}
