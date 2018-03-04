//
//  MovieSearchViewContract.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieSearchViewContract: class, Loadable {
    func configure(with viewModel: MovieSearchControllerViewModel)
    func displayAlertPopUp(title: String, message: String)
    func scrollWhenNewQuery()
    func reloadTableView()
}
