//
//  LoadingView.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 04/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: UIView, Loadable {

    // MARK: - Private properties

    private let activityIndicatorView = UIActivityIndicatorView()
    private let backgroundView = UIView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Loadable

    func hideLoading() {
        isHidden = true
        activityIndicatorView.stopAnimating()
    }

    func displayLoading() {
        isHidden = false
        activityIndicatorView.startAnimating()
    }

    // MARK: - Private methods

    private func setupActivityIndicatorView() {
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
    }

    private func setupBackgroundView() {
        backgroundView.backgroundColor = UIColor.darkBackgroundColor
    }

    private func setupLayout() {
        addSubview(backgroundView)
        addSubview(activityIndicatorView)
        backgroundView.pinToSuperView(edges: .all, insets: .zero)
        activityIndicatorView.centerInSuperView()
    }

    private func setup() {
        isHidden = true
        setupActivityIndicatorView()
        setupBackgroundView()
        setupLayout()
    }
}
