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

    func map() -> MovieDetailsCollectionViewModel {
        return MovieDetailsCollectionViewModel(cells:
            cells.map { MovieDetailsCellViewModelMapper(rating: $0).map() }
        )
    }
}
