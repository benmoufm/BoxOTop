//
//  Color.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 28/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    // MARK: - Background colors

    static let mainColor = UIColor(red: 95/255, green: 158/255, blue: 70/255, alpha: 1)
    static let backgroundColor = UIColor.white
    static let navigationBarColor = UIColor(red: 95/255, green: 158/255, blue: 70/255, alpha: 1)
    static let darkBackgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
    static let unevenMovieSearchTableViewCellColor = UIColor(red: 173/255, green: 209/255, blue: 158/255, alpha: 0.5)
    static let evenMovieSearchTableViewCellColor = UIColor.clear
    static let ratingCollectionViewCellColor = UIColor.mainColor.withAlphaComponent(0.2)

    // MARK: - Text colors

    static let navigationBarTextColor = UIColor.white
    static let titleColor = UIColor.black
    static let subtitleColor = UIColor.darkText
}
