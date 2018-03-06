//
//  MovieDetailsCollectionViewModel.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieDetailsCollectionViewModel {
    let cells: [MovieDetailsCellViewModel]

    static let empty = MovieDetailsCollectionViewModel(cells: [])
}
