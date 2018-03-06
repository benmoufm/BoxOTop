//
//  MovieDetailsPresenter.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterDelegate: class {
    func movieDetailsPresenter(_ presenter: MovieDetailsPresenter, id: String)
}

protocol MovieDetailsPresenter: Startable {
    func addMyRating()
    func reload()
}
