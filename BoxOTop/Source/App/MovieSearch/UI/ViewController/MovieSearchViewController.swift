//
//  MovieSearchViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 26/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class MovieSearchViewController: SharedViewController, MovieSearchViewContract, UISearchBarDelegate, MovieSearchTableViewDataSourceDelegate {

    var presenter: MovieSearchPresenter?

    // MARK: - Private properties

    private var welcomeLabel = UILabel()
    private var tableView = UITableView()
    private var dataSource = MovieSearchTableViewDataSource()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchButton = UIButton()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - MovieSearchViewContract

    func configure(with viewModel: MovieSearchControllerViewModel) {
        dataSource.update(with: viewModel.tableView)
        tableView.reloadData()
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

    func scrollWhenNewQuery() {
        tableView.isHidden = false
        welcomeLabel.isHidden = true
        tableView.reloadData()
        tableView.scrollRectToVisible(.zero, animated: true)
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    // MARK: - UISearchBarDelegate

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.searchController?.dismiss(animated: true, completion: nil)
        guard let searchBarText = searchBar.text else { return }
            presenter?.searchMovies(with: searchBarText)
    }

    // MARK: - MovieSearchTableViewDataSourceDelegate

    func loadMoreCells() {
        presenter?.loadMoreCells()
    }

    func movieSearchTableViewDataSource(_ dataSource: MovieSearchTableViewDataSource, id: String) {
        presenter?.didSelectMovieCell(with: id)
    }

    // MARK: - Action methods

    @objc func toggleSearchBarDown() {
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        (navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField)?.textColor = UIColor.navigationBarTextColor
        UIView.animate(withDuration: 0.3) {
            self.navigationItem.searchController?.searchBar.becomeFirstResponder()
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - Private methods

    private func setupSearchController() {
        searchController.searchBar.tintColor = UIColor.navigationBarTextColor
        searchController.searchBar.placeholder = "movie_search_search_bar_placeholder_text".localized
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    private func setupSearchButton() {
        searchButton.setImage(#imageLiteral(resourceName: "searchIcon"), for: .normal)
        searchButton.addTarget(self, action: #selector(toggleSearchBarDown), for: .touchUpInside)
    }

    private func setupNavigationBar() {
        navigationItem.title = "movie_search_navigation_bar_title".localized
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
    }

    private func setupWelcomeLabel() {
        welcomeLabel.text = "movie_search_welcome_label_text".localized
        welcomeLabel.textColor = UIColor.mainColor
        welcomeLabel.numberOfLines = 2
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        welcomeLabel.textAlignment = .center
    }

    private func setupTableView() {
        tableView.isHidden = true
        dataSource.configure(tableView)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        dataSource.delegate = self
    }

    private func setupLayout() {
        view.addSubview(welcomeLabel)
        view.addSubview(tableView)

        welcomeLabel.centerInSuperView()
        tableView.pinToSuperView(edges: .all, insets: .zero)
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupSearchController()
        setupSearchButton()
        setupNavigationBar()
        setupWelcomeLabel()
        setupTableView()
        setupLayout()
    }
}
