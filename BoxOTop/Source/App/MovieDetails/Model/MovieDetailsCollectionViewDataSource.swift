//
//  MovieDetailsCollectionViewDataSource.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    var viewModel: MovieDetailsCollectionViewModel = .empty

    // MARK: - MovieDetailsCollectionViewDataSource

    func configure(_ collectionView: UICollectionView) {
        collectionView.register(class: RatingCollectionViewCell.self)
    }

    func update(with viewModel: MovieDetailsCollectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UICollectionViewDatasource UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RatingCollectionViewCell = collectionView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.cells[indexPath.row])
        cell.backgroundColor = UIColor.mainColor.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 5.0
        return cell
    }
}
