//
//  MovieSearchTableViewModel.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieSearchTableViewModel {
    let cells: [MovieSearchCellViewModel]

    static let empty = MovieSearchTableViewModel(cells: [])
}
