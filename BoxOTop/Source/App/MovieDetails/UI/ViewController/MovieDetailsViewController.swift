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

class MovieDetailsViewController: SharedViewController, MovieDetailsViewContract, MovieDetailsCollectionViewDataSourceDelegate {

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
    private let layout = UICollectionViewFlowLayout()
    private lazy var ratingsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    private let dataSource = MovieDetailsCollectionViewDataSource()

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
        releaseDateLabel.text = "movie_details_release_date_label_text".localized + viewModel.releaseDate
        directorLabel.text = "movie_details_directed_by_label_text".localized + viewModel.director
        genreLabel.text = "movie_details_genre_label_text".localized + viewModel.genre
        runtimeLabel.text = "movie_details_runtime_label_text".localized + viewModel.runtime
        synopsisTextLabel.text = viewModel.synopsis
        castingTextLabel.text = viewModel.casting
        dataSource.update(with: viewModel.ratings)
        ratingsCollectionView.reloadData()
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

    // MARK: - MovieDetailsCollectionViewDataSourceDelegate

    func addMyRating() {
        presenter?.addMyRating()
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationItem.title = "movie_details_navigation_bar_title".localized
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
        titleLabel.text = "movie_details_title_label_text".localized
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
    }

    private func setupDirectorLabel() {
        directorLabel.text = "movie_details_directed_by_label_text".localized
    }

    private func setupReleaseDate() {
        releaseDateLabel.text = "movie_details_release_date_label_text".localized
    }

    private func setupGenreLabel() {
        genreLabel.text = "movie_details_genre_label_text".localized
    }

    private func setupRuntimeLabel() {
        runtimeLabel.text = "movie_details_runtime_label_text".localized
    }

    private func setupSynopsis() {
        synopsisTitleLabel.text = "movie_details_synopsis_label_text".localized
        synopsisTitleLabel.font = UIFont.systemFont(ofSize: 18)
        synopsisTextLabel.numberOfLines = 0
    }

    private func setupCasting() {
        castingTitleLabel.text = "movie_details_casting_label_text".localized
        castingTitleLabel.font = UIFont.systemFont(ofSize: 18)
        castingTextLabel.numberOfLines = 0
    }

    private func setupRatingsCollectionView() {
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 180, height: 50)
        ratingsCollectionView.backgroundColor = UIColor.backgroundColor
        dataSource.configure(ratingsCollectionView)
        ratingsCollectionView.delegate = dataSource
        ratingsCollectionView.dataSource = dataSource
        dataSource.delegate = self
    }

    private func setupLayout() {
        view.addSubview(posterImageView)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(releaseDateLabel)
        verticalStackView.addArrangedSubview(directorLabel)
        verticalStackView.addArrangedSubview(genreLabel)
        verticalStackView.addArrangedSubview(runtimeLabel)
        view.addSubview(ratingsCollectionView)
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

        ratingsCollectionView.pinToSuperView(edges: [.right, .left], insets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5))
        ratingsCollectionView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 5).isActive = true
        ratingsCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        stackView.pinToSuperView(edges: [.right, .left], insets: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5))
        stackView.topAnchor.constraint(equalTo: ratingsCollectionView.bottomAnchor, constant: 5).isActive = true
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
        setupRatingsCollectionView()
        setupSynopsis()
        setupCasting()
        setupLayout()
    }

}
