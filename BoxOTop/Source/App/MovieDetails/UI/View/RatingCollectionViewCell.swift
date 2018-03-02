//
//  RatingCell.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class RatingCollectionViewCell: UICollectionViewCell {

    // MARK: - Private properties

    private let sourceLabel = UILabel()
    private let starRater = StarRaterView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - RatingCell

    func configure(with viewModel: MovieDetailsCellViewModel) {
        sourceLabel.text = viewModel.ratingSource
        starRater.configure(with: viewModel.stars)
    }

    // MARK: - Private methods

    private func setupSourceLabel() {
        sourceLabel.textColor = UIColor.lightGreyTextColor
        sourceLabel.adjustsFontSizeToFitWidth = true
        sourceLabel.textAlignment = .left
    }

    private func setupLayout() {
        contentView.addSubview(sourceLabel)
        contentView.addSubview(starRater)

        sourceLabel.pinToSuperView(edges: [.top, .left, .right], insets: UIEdgeInsets(top: 2, left: 2, bottom: 0, right: -2))
        starRater.pinToSuperView(edges: [.bottom, .left, .right], insets: UIEdgeInsets(top: 0, left: 2, bottom: -5, right: -2))
    }

    private func setup() {
        setupSourceLabel()
        setupLayout()
    }
}
