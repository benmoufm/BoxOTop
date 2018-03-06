//
//  MovieReviewViewContract.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieReviewViewContract: class, Alertable {
    func configure(with viewModel: MovieReviewControllerViewModel)
}
