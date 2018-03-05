//
//  PlusCollectionViewCell.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class PlusCollectionViewCell: UICollectionViewCell {

    // MARK: - Private properties

    private let plusLabel = UILabel()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Private methods

    private func setupPlusLabel() {
        plusLabel.text = "movie_details_add_review_cell_text".localized
        plusLabel.textColor = UIColor.lightGreyTextColor
        plusLabel.font = UIFont.boldSystemFont(ofSize: 35)
        plusLabel.textAlignment = .center
    }

    private func setupLayout() {
        contentView.addSubview(plusLabel)
        plusLabel.pinToSuperView(edges: .all, insets: .zero)
    }

    private func setup() {
        setupPlusLabel()
        setupLayout()
    }

}
