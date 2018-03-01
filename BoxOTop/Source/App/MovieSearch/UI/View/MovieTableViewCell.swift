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

class MovieTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private var posterImageView = UIImageView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()

    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - MovieTableViewCell

    func configure(with viewModel: MovieCellViewModel) {
        if let url = URL(string: viewModel.posterURL) {
            posterImageView.sd_setImage(
                with: url,
                placeholderImage: #imageLiteral(resourceName: "posterPlaceholder"),
                options: .highPriority,
                completed: { (image, error, imageCacheType, url) in
                    if image == nil {
                        self.posterImageView.image = #imageLiteral(resourceName: "posterPlaceholder")
                        self.posterImageView.tintColor = UIColor.mainColor
                    }
            })
        }
        titleLabel.text = viewModel.title
        yearLabel.text = viewModel.year
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
        contentView.addSubview(posterImageView)
        contentView.addSubview(stackView)

        posterImageView.pinToSuperView(edges: [.top, .bottom, .left], insets: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: 0))
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
