//
//  MovieDetailsViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 01/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController, MovieDetailsViewContract {

    var presenter: MovieDetailsPresenter?

    // MARK: - Private properties

    private let posterImageView = UIImageView()
    private let verticalStackView = UIStackView()
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let directorLabel = UILabel()
    private let genreLabel = UILabel()
    private let runtimeLabel = UILabel()
    private let stackView = UIStackView()
    private let synopsisTitleLabel = UILabel()
    private let synopsisTextLabel = UILabel()
    private let castingTitleLabel = UILabel()
    private let castingTextLabel = UILabel()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - MovieDetailsViewContract

    func configure(with viewModel: MovieDetailsControllerViewModel) {
        titleLabel.text = viewModel.title
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
        } else {
            posterImageView.image = #imageLiteral(resourceName: "posterPlaceholder")
            posterImageView.tintColor = UIColor.mainColor
        }
        releaseDateLabel.text = "Release date : " + viewModel.releaseDate
        directorLabel.text = "Directed by : " + viewModel.director
        genreLabel.text = "Genre : " + viewModel.genre
        runtimeLabel.text = "Runtime : " + viewModel.runtime
        synopsisTextLabel.text = viewModel.synopsis
        castingTextLabel.text = viewModel.casting
    }

    func displayAlertPopUp(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        alert.addAction(UIAlertAction(
            title: "Ok",
            style: UIAlertActionStyle.default, handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationItem.title = "📺 Details"
        navigationController?.navigationBar.barTintColor = UIColor.navigationBarColor
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.navigationBarTextColor
        ]
    }

    private func setupVerticalStackView() {
        verticalStackView.alignment = .leading
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 5
    }

    private func setupStackView() {
        stackView.alignment = .top
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
    }

    private func setupPosterImageView() {
        posterImageView.image = #imageLiteral(resourceName: "posterPlaceholder")
        posterImageView.tintColor = UIColor.mainColor
        posterImageView.contentMode = .scaleAspectFit
    }

    private func setupTitleLabel() {
        titleLabel.text = "Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }

    private func setupDirectorLabel() {
        directorLabel.text = "Directed by : "
    }

    private func setupReleaseDate() {
        releaseDateLabel.text = "Release date : "
    }

    private func setupGenreLabel() {
        genreLabel.text = "Genre : "
    }

    private func setupRuntimeLabel() {
        runtimeLabel.text = "Runtime : "
    }

    private func setupSynopsis() {
        synopsisTitleLabel.text = "Synopsis :"
        synopsisTitleLabel.font = UIFont.systemFont(ofSize: 18)
        synopsisTextLabel.numberOfLines = 0
    }

    private func setupCasting() {
        castingTitleLabel.text = "Casting :"
        castingTitleLabel.font = UIFont.systemFont(ofSize: 18)
        castingTextLabel.numberOfLines = 0
    }

    private func setupLayout() {
        view.addSubview(posterImageView)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(releaseDateLabel)
        verticalStackView.addArrangedSubview(directorLabel)
        verticalStackView.addArrangedSubview(genreLabel)
        verticalStackView.addArrangedSubview(runtimeLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(synopsisTitleLabel)
        stackView.addArrangedSubview(synopsisTextLabel)
        stackView.addArrangedSubview(castingTitleLabel)
        stackView.addArrangedSubview(castingTextLabel)

        posterImageView.pinToSuperView(edges: .left, insets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0))
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        verticalStackView.pinToSuperView(edges: .right, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -5))
        verticalStackView.topAnchor.constraint(equalTo: posterImageView.topAnchor).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: 5).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor).isActive = true

        stackView.pinToSuperView(edges: [.right, .left], insets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5))
        stackView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 5).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupVerticalStackView()
        setupTitleLabel()
        setupPosterImageView()
        setupReleaseDate()
        setupDirectorLabel()
        setupGenreLabel()
        setupRuntimeLabel()
        setupStackView()
        setupSynopsis()
        setupCasting()
        setupLayout()
    }

}
