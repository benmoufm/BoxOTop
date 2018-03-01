//
//  LoadTableViewCell.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 28/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class LoadTableViewCell: UITableViewCell, Loadable {

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

    // MARK: - UITableViewCell

    override var isSelected: Bool {
        didSet {
            if isSelected {
                displayLoading()
            } else {
                hideLoading()
            }
        }
    }

    // MARK: - Loadable

    func displayLoading() {
        loadLabel.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        loadLabel.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }

    // MARK: - Private methods

    private func setupLoadLabel() {
        loadLabel.isHidden = false
        loadLabel.text = "..."
        loadLabel.textColor = UIColor.darkText
        loadLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
    }

    private func setupActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.activityIndicatorViewStyle = .gray
    }

    private func setupLayout() {
        contentView.addSubview(loadLabel)
        contentView.addSubview(activityIndicator)

        loadLabel.centerInSuperView()
        activityIndicator.centerInSuperView()
    }

    private func setup() {
        setupLoadLabel()
        setupActivityIndicator()
        setupLayout()
    }
}
