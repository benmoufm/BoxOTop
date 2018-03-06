//
//  MovieSearchCellViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct MovieCellViewModelMapper {
    let id: String
    let posterURL: URL?
    let title: String
    let year: String

    func map() -> MovieCellViewModel {
        return MovieCellViewModel(id: id, posterURL: posterURL, title: title, year: year)
    }
}
