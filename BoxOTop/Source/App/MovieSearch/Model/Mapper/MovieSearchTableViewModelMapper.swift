//
//  MovieSearchTableViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieSearchTableViewModelMapper {
    let cells: [Movie]

    func map() -> MovieSearchTableViewModel {
        let moviesCellViewModel = cells.map {
            return MovieSearchCellViewModelMapper(
                id: $0.id,
                posterURL: $0.posterURL,
                title: $0.title,
                year: $0.year
                ).map()
        }
        return MovieSearchTableViewModel(cells: moviesCellViewModel)
    }
}
