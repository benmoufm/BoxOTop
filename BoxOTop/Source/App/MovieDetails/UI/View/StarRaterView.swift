//
//  StarRaterView.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 02/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class StarRaterView: UIView {

    private var starNumber: Int = 0
    private var rating: Float = 0.0
    private var starImageViews: [StarView] = []
    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - StarRaterView.swift

    func configure(with viewModel: StarRaterViewModel) {
        starNumber = viewModel.starNumber
        rating = viewModel.rating
        updateStarViews()
    }

    // MARK: - Private methods

    private func generateStarViews() {
        starImageViews = []
        (0..<starNumber)
            .map(generateStar)
            .forEach { starImageViews.append($0) }
    }

    private func generateStar(_ index: Int) -> StarView {
        let ratingWithNumberOfStars = self.rating * Float(starNumber)
        let rating = Int(floorf(ratingWithNumberOfStars))
        var ratio = index < rating ? 1 : ratingWithNumberOfStars - Float(rating)
        ratio = index > rating ? 0 : ratio
        let starViewModel = StarViewModelMapper(fillingRatio: CGFloat(ratio)).map()
        let starView = StarView()
        starView.configure(with: starViewModel)
        return starView
    }

    private func updateStarViews() {
        starImageViews.forEach(stackView.removeArrangedSubview)
        starImageViews.forEach { $0.removeFromSuperview() }
        generateStarViews()
        starImageViews.forEach(stackView.addArrangedSubview)
    }

    private func setup() {
        setupStackView()
        setupLayout()
    }

    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10.0
    }

    private func setupLayout() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
