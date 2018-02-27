//
//  CustomErrors.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

enum CustomErrors: LocalizedError {
    case unexpectedJSONFormat

    public var errorDescription: String? {
        switch self {
        case .unexpectedJSONFormat:
            return "Error. Unexpected JSON Format"
        }
    }
}
