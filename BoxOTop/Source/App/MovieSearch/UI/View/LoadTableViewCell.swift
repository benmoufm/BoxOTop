//
//  LoadTableViewCell.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 28/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class LoadTableViewCell: UITableViewCell {

    // MARK: - Private properties

    private let loadLabel = UILabel()
    private let activityIndicator = UIActivityIndicatorView()

    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Private methods

    private func setupLoadLabel() {
        loadLabel.text = "..."
        loadLabel.textColor = UIColor.darkText
        loadLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
    }

    private func setupActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.activityIndicatorViewStyle = .gray
    }

    private func setupLayout() {
        addSubview(loadLabel)
        addSubview(activityIndicator)

        loadLabel.translatesAutoresizingMaskIntoConstraints = false
        loadLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private func setup() {
        setupLoadLabel()
        setupActivityIndicator()
        setupLayout()
    }
}
