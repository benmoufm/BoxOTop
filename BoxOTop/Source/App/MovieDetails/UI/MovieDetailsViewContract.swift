//
//  MovieDetailsViewContract.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol MovieDetailsViewContract: class, Loadable, Alertable {
    func configure(with viewModel: MovieDetailsControllerViewModel)
    func reloadCollectionView()
}
