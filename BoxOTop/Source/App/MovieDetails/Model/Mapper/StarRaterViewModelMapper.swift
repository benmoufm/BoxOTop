//
//  StarRaterViewModelMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct StarRaterViewModelMapper {
    let starNumber: Int
    let rating: Float

    func map() -> StarRaterViewModel {
        return StarRaterViewModel(starNumber: starNumber, rating: rating)
    }
}
