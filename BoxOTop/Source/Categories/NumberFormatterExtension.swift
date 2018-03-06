//
//  NumberFormatterExtension.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var percentFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter
    }

    func numberFromFraction(string: String) -> NSNumber? {
        let numbers = string.split(separator: "/")
            .map { String($0) }
            .map { number(from: $0) }
            .flatMap { $0 }
        guard numbers.count == 2,
            let denominator = numbers.first,
            let divisor = numbers.last
            else { return nil }
        return NSNumber(value: denominator.floatValue / divisor.floatValue)
    }
}
