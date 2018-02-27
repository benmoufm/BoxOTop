//
//  ViewControllerFactory.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

final class ViewControllerFactory {
    static let instance = ViewControllerFactory()

    private init() {}

    func movieSearchViewController() -> MovieSearchViewController {
        let movieSearchViewController = MovieSearchViewController()
        return movieSearchViewController
    }
}
