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
    case searchQueryNull
    case queryTooShort

    public var errorDescription: String? {
        switch self {
        case .unexpectedJSONFormat:
            return "custom_error_unexpected_json_format_text".localized
        case .searchQueryNull:
            return "custom_error_search_query_nil_text".localized
        case .queryTooShort:
            return "custom_error_query_too_short_text".localized
        }
    }
}
