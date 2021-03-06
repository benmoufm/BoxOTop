//
//  MovieDetailsCollectionViewDataSource.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailsCollectionViewDataSourceDelegate: class {
    func addMyRating()
}

class MovieDetailsCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var viewModel: MovieDetailsCollectionViewModel = .empty
    weak var delegate: MovieDetailsCollectionViewDataSourceDelegate?

    // MARK: - MovieDetailsCollectionViewDataSource

    func configure(_ collectionView: UICollectionView) {
        collectionView.register(class: RatingCollectionViewCell.self)
        collectionView.register(class: PlusCollectionViewCell.self)
    }

    func update(with viewModel: MovieDetailsCollectionViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UICollectionViewDatasource UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = viewModel.cells[indexPath.row]
        switch cellViewModel {
        case .ratingCell(let ratingCellViewModel):
            let cell: RatingCollectionViewCell = collectionView.dequeueCell(at: indexPath)
            cell.configure(with: ratingCellViewModel)
            setupCell(cell: cell)
            return cell
        case .plusCell:
            let cell: PlusCollectionViewCell = collectionView.dequeueCell(at: indexPath)
            setupCell(cell: cell)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewModel = viewModel.cells[indexPath.row]
        switch cellViewModel {
        case .plusCell:
            delegate?.addMyRating()
        default:
            break
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 2.0) - 15, height: 50)
    }

    // MARK: - Private methods

    private func setupCell(cell: UICollectionViewCell) {
        cell.backgroundColor = UIColor.mainColor.withAlphaComponent(0.2)
        cell.layer.cornerRadius = 5.0
    }
}
