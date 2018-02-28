//
//  MovieSearchControllerViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieSearchControllerViewModelMapper {
    let cells: [Movie]
    let totalResults: Int

    func map() -> MovieSearchControllerViewModel {
        return MovieSearchControllerViewModel(
            tableView: MovieSearchTableViewModelMapper(cells: cells, totalResults: totalResults).map()
        )
    }
}
