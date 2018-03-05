//
//  MovieReviewViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 05/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MovieReviewViewController: SharedViewController, MovieReviewViewContract {

    var presenter: MovieReviewPresenter?

    // MARK: - Private properties

    private lazy var containerView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var ratingSlider = UISlider()
    private lazy var ratingLabel = UILabel()
    private lazy var buttonStackView = UIStackView()
    private lazy var cancelButton = UIButton()
    private lazy var submitButton = UIButton()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - MovieSearchViewContract

    func configure(with viewModel: MovieReviewControllerViewModel) {
        titleLabel.text = viewModel.title
        ratingLabel.text = viewModel.ratingLabel + "\(viewModel.currentRating)%"
        cancelButton.setTitle(viewModel.cancelButtonTitle, for: .normal)
        submitButton.setTitle(viewModel.submitButtonTitle, for: .normal)
    }

    // MARK: - @objc methods

    @objc func cancelButtonPressed() {
        presenter?.dismissSubmitReview()
    }

    @objc func ratingSliderDidChange() {
        presenter?.updateRating(rating: ratingSlider.value)
    }

    // MARK: - Private methods

    private func setupContainerView() {
        containerView.backgroundColor = UIColor.backgroundColor
    }

    private func setupTitleLabel() {
        titleLabel.textColor = UIColor.titleColor
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
    }

    private func setupRatingSlider() {
        ratingSlider.thumbTintColor = UIColor.mainColor
        ratingSlider.minimumTrackTintColor = UIColor.mainColor
        ratingSlider.maximumValue = 100
        ratingSlider.addTarget(self, action: #selector(ratingSliderDidChange), for: .valueChanged)
    }

    private func setupRatingLabel() {
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = UIColor.subtitleColor
        ratingLabel.font = UIFont.systemFont(ofSize: 14)
    }

    private func setupButtonStackView() {
        buttonStackView.alignment = .center
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
    }

    private func setupCancelButton() {
        cancelButton.setTitleColor(UIColor.mainColor, for: .normal)
        cancelButton.tintColor = UIColor.mainColor
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    }

    private func setupSubmitButton() {
        submitButton.setTitleColor(UIColor.mainColor, for: .normal)
        submitButton.tintColor = UIColor.mainColor
    }

    private func setupLayout() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(ratingSlider)
        containerView.addSubview(ratingLabel)
        containerView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(submitButton)

        containerView.centerInSuperView()
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 350).isActive = true

        titleLabel.pinToSuperView(edges: [.top, .right, .left], insets: UIEdgeInsets(top: 20, left: 5, bottom: 0, right: -5))

        ratingSlider.pinToSuperView(edges: [.right, .left], insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        ratingSlider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true

        ratingLabel.pinToSuperView(edges: [.right, .left], insets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5))
        ratingLabel.topAnchor.constraint(equalTo: ratingSlider.bottomAnchor, constant: 20).isActive = true

        buttonStackView.pinToSuperView(edges: [.bottom, .right, .left], insets: UIEdgeInsets(top: 0, left: 10, bottom: -20, right: -10))
        buttonStackView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.darkBackgroundColor
        setupContainerView()
        setupTitleLabel()
        setupRatingSlider()
        setupRatingLabel()
        setupButtonStackView()
        setupCancelButton()
        setupSubmitButton()
        setupLayout()
    }
}
