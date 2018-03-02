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
        // TODO (Mélodie Benmouffek) 02/03/2018 Configure with view model
    }

    // MARK: - Private methods

    private func setupLayout() {
        contentView.addSubview(sourceLabel)
        sourceLabel.pinToSuperView(edges: .all, insets: .zero)
    }

    private func setup() {
        setupLayout()
    }
}
