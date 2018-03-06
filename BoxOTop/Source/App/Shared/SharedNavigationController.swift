//
//  SharedNavigationController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 04/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class SharedNavigationController: UINavigationController {

    // MARK: - Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationBar.barTintColor = UIColor.navigationBarColor
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.navigationBarTextColor
        ]
    }

    private func setup() {
        setupNavigationBar()
    }
}
