//
//  UIViewExtension.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func pinToSuperView(edges: UIRectEdge, insets: UIEdgeInsets) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        if edges.contains(.top) {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        }
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom).isActive = true
        }
        if edges.contains(.left) {
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left).isActive = true
        }
        if edges.contains(.right) {
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: insets.right).isActive = true
        }
    }

    func centerInSuperView() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
