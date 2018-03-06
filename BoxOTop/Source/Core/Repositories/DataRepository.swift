//
//  DataRepository.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation

protocol DataRepository {
    func save(with id: String, rating: Float, completion: ((Result<Bool>) -> Void)?)
    func fetch(with id: String, completion: ((Result<Review?>) -> Void)?)
}
