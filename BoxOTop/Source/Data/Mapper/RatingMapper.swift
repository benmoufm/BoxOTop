//
//  RatingMapper.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

struct RatingMapper {
    let restRating: RestRating

    func map() -> Rating {
        return Rating(source: restRating.source, value: restRating.value)
    }
}
