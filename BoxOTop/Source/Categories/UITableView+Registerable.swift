//
//  UITableView+Registerable.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register(`class`: AnyClass) {
        register(`class`, forCellReuseIdentifier: NSStringFromClass(`class`))
    }

    func dequeueCell<T>(at indexPath: IndexPath) -> T {
        let reuseIdentifier = NSStringFromClass(T.self as! AnyClass)
        guard
            let cell: T = dequeueReusableCell(
                withIdentifier: reuseIdentifier,
                for: indexPath
                ) as? T else {
                    fatalError("Cell type was not registered")
        }
        return cell
    }
}
