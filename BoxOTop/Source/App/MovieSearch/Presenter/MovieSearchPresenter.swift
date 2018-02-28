//
//  MovieSearchPresenter.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieSearchPresenter: Startable {
    func searchMovies(with query: String, _ completion: ((Bool) -> Void)?)
    func loadMoreCells(_ completion: ((Bool) -> Void)?)
}
