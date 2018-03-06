//
//  DataRepositoryImplementation.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataRepositoryImplementation: DataRepository {

    let managedContext: NSManagedObjectContext

    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }

    func save(with id: String, rating: Float, completion: ((Result<Bool>) -> Void)?) {
        let review = Review(context: managedContext)
        review.movieID = id
        review.movieRating = rating
        do {
            try managedContext.save()
            completion?(.value(true))
        } catch {
            completion?(.error(error as NSError))
        }
    }

    func fetch(with id: String, completion: ((Result<Review?>) -> Void)?) {
        let fetchRequest = NSFetchRequest<Review>(entityName: "Review")
        do {
            let reviews = try managedContext.fetch(fetchRequest)
            let review = reviews.filter { $0.movieID == id }.first
            completion?(.value(review))
        } catch let error as NSError {
            completion?(.error(error as NSError))
        }
    }
}
