//
//  MainCoordinator.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let movieSearchViewController = ViewControllerFactory.instance.movieSearchViewController()
        window.rootViewController = movieSearchViewController
    }
}
