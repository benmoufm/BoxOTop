//
//  MovieSearchTableViewCell.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MovieSearchTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private var posterImageView = UIImageView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()

    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - MovieSearchTableViewCell

    func configure(with viewModel: MovieSearchCellViewModel) {
        if let url = URL(string: viewModel.posterURL) { posterImageView.sd_setImage(with: url, completed: nil) }
        titleLabel.text = viewModel.title
        yearLabel.text = viewModel.year
        setup()
    }

    // MARK: - Private methods

    private func setupPosterImageView() {
        posterImageView.contentMode = .scaleAspectFit
    }

    private func setupStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(yearLabel)

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 5.0
    }

    private func setupTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.titleColor
    }

    private func setupYearLabel() {
        yearLabel.font = UIFont.italicSystemFont(ofSize: 12)
        yearLabel.textColor = UIColor.subtitleColor
    }

    private func setupLayout() {
        addSubview(posterImageView)
        addSubview(stackView)

        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: posterImageView.centerYAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        stackView.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 20).isActive = true
    }

    private func setup() {
        setupPosterImageView()
        setupStackView()
        setupTitleLabel()
        setupYearLabel()
        setupLayout()
    }
}
