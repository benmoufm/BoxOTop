//
//  UIViewController+OverCurrentContextPresentation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol DismissViewControllerObserver {
    func presentedViewControllerWillDisappear()
}

extension UINavigationController: DismissViewControllerObserver {
    func presentedViewControllerWillDisappear() {
        if let dismissViewControllerObserver = topViewController as? DismissViewControllerObserver {
            dismissViewControllerObserver.presentedViewControllerWillDisappear()
        }
    }
}
