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
    let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        let movieSearchViewController = ViewControllerFactory.instance.movieSearchViewController()
        navigationController.pushViewController(movieSearchViewController, animated: false)
        window.rootViewController = navigationController
    }
}
