//
//  RestMovie.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestMovie {
    let id: String
    let title: String
    let year: String
    let posterURL: String

    init(json: JSON) throws {
        guard
            let id = json["imdbID"].string,
            let title = json["Title"].string,
            let year = json["Year"].string,
            let posterURL = json["Poster"].string
            else { throw CustomErrors.unexpectedJSONFormat }
        self.id = id
        self.title = title
        self.year = year
        self.posterURL = posterURL
    }
}
