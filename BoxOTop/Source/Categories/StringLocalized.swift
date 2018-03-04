//
//  StringLocalized.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 04/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
