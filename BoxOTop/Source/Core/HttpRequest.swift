//
//  HttpRequest.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import Alamofire

struct HttpRequest {
    let method: HTTPMethod
    let headers: HTTPHeaders
    let encoding: URLEncoding
    let parameters: [String: Any]

    init(
        method: HTTPMethod = HTTPMethod.get,
        headers: HTTPHeaders = HTTPHeaders(),
        encoding: URLEncoding = URLEncoding.default,
        parameters: [String: Any]
        )
    {
        self.method = method
        self.headers = headers
        self.encoding = encoding
        self.parameters = parameters
    }
}
