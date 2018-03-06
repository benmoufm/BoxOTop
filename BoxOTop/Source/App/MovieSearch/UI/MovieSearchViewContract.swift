//
//  MovieSearchViewContract.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieSearchViewContract: class, Loadable, Alertable {
    func configure(with viewModel: MovieSearchControllerViewModel)
    func scrollWhenNewQuery()
    func reloadTableView()
}
