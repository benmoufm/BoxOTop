//
//  RestMovieDetail.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestMovieDetail {
    let id: String
    let title: String
    let posterURL: URL?
    let releaseDate: String
    let director: String
    let genre: String
    let runtime: String
    let ratings: [RestRating]
    let synopsis: String
    let casting: String

    init(json: JSON) throws {
        if let response = json["Response"].string,
            response == "True" {
            guard
                let id = json["imdbID"].string,
                let title = json["Title"].string,
                let posterURL = json["Poster"].string,
                let releaseDate = json["Released"].string,
                let ratings = json["Ratings"].array,
                let genre = json["Genre"].string,
                let runtime = json["Runtime"].string,
                let director = json["Director"].string,
                let synopsis = json["Plot"].string,
                let casting = json["Actors"].string
                else { throw CustomErrors.unexpectedJSONFormat }
            self.id = id
            self.title = title
            self.posterURL = URL(string: posterURL)
            self.releaseDate = releaseDate
            self.director = director
            self.genre = genre
            self.runtime = runtime
            self.ratings = ratings.map {
                do {
                    return try RestRating(json: $0)
                } catch {
                    return nil
                }
                }.flatMap { $0 }
            self.synopsis = synopsis
            self.casting = casting
        } else {
            throw CustomErrors.noResult
        }
    }
}
