//
//  RestRating.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestRating {
    let source: String
    let value: Float

    init(json: JSON) throws {
        let numberFormatter = NumberFormatter()
        guard
            let source = json["Source"].string,
            let value = json["Value"].string,
            let rating = NumberFormatter.percentFormatter.number(from: value) ??
                numberFormatter.numberFromFraction(string: value)
            else { throw CustomErrors.unexpectedJSONFormat }
        self.source = source
        self.value = rating.floatValue
    }
}
