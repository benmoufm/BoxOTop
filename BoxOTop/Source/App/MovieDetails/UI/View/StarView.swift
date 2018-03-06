//
//  StarView.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class StarView: UIView {
    private let fullImageView = UIImageView(image: #imageLiteral(resourceName: "fullStarIcon"))
    private let emptyImageView = UIImageView(image: #imageLiteral(resourceName: "emptyStarIcon"))
    private let shapeLayer = CAShapeLayer()
    private var fillingRatio: CGFloat = 0.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - UIView

    override func layoutSubviews() {
        super.layoutSubviews()
        updateShapeLayer()
    }

    // MARK: - StarView.swift

    func configure(with viewModel: StarViewModel) {
        fillingRatio = viewModel.fillingRatio
        updateShapeLayer()
    }

    // MARK: - Private methods

    private func setup() {
        setupLayout()
        setupShapeLayer()
        fullImageView.tintColor = UIColor.mainColor
        emptyImageView.tintColor = UIColor.mainColor
    }

    private func setupShapeLayer() {
        fullImageView.layer.mask = shapeLayer
    }

    private func updateShapeLayer() {
        let width = bounds.width * fillingRatio
        let size = CGSize(width: width, height: bounds.height)
        let rect = CGRect(origin: .zero, size: size)
        shapeLayer.path = UIBezierPath(rect: rect).cgPath
    }

    private func setupLayout() {
        [fullImageView, emptyImageView].forEach(addSubview)
        [fullImageView, emptyImageView].forEach { $0.pinToSuperView(edges: .all, insets: .zero) }
    }
}
