//
//  MovieSearchViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 26/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, MovieSearchViewContract, UISearchBarDelegate, MovieSearchTableViewDataSourceDelegate {

    var presenter: MovieSearchPresenter?

    // MARK: - Private properties

    private var welcomeLabel = UILabel()
    private var tableView = UITableView()
    private var dataSource = MovieSearchTableViewDataSource()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchButton = UIButton()
    private var activityIndicator = UIActivityIndicatorView()
    private var activityIndicatorBackgroundView = UIView()

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

    // MARK: - Loadable

    func displayLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        activityIndicatorBackgroundView.isHidden = false
    }

    func hideLoading() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.activityIndicatorBackgroundView.isHidden = true
    }

    // MARK: - UISearchBarDelegate

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.searchController?.dismiss(animated: true, completion: nil)
        guard let searchBarText = searchBar.text else { return }
            presenter?.searchMovies(with: searchBarText, { (success) in
                if success {
                    self.tableView.isHidden = false
                    self.welcomeLabel.isHidden = true
                    self.tableView.reloadData()
                    self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                }
            })
    }

    // MARK: - MovieSearchTableViewDataSourceDelegate

    func loadMoreCells() {
        presenter?.loadMoreCells({ (success) in
            if success {
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Action methods

    @objc func toggleSearchBarDown() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a movie..."
        navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        (navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField)?.textColor = UIColor.navigationBarTextColor
        navigationItem.searchController?.searchBar.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem()
        UIView.animate(withDuration: 0.3) {
            self.navigationItem.searchController?.searchBar.becomeFirstResponder()
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - Private methods

    private func setupSearchButton() {
        searchButton.setImage(#imageLiteral(resourceName: "searchIcon"), for: .normal)
        searchButton.addTarget(self, action: #selector(toggleSearchBarDown), for: .touchUpInside)
    }

    private func setupNavigationBar() {
        navigationItem.title = "📺 Box Office"
        navigationController?.navigationBar.barTintColor = UIColor.navigationBarColor
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.navigationBarTextColor
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
    }

    private func setupWelcomeLabel() {
        welcomeLabel.text = "Welcome to BoxOfice !\n Search for your favorite movies !"
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

    private func setupActivityIndicatorView() {
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.isHidden = true
        activityIndicatorBackgroundView.backgroundColor = UIColor.darkBackgroundColor
        activityIndicatorBackgroundView.isHidden = true
    }

    private func setupLayout() {
        view.addSubview(welcomeLabel)
        view.addSubview(tableView)
        view.addSubview(activityIndicatorBackgroundView)
        view.addSubview(activityIndicator)

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        activityIndicatorBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        activityIndicatorBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        activityIndicatorBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        activityIndicatorBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: activityIndicatorBackgroundView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: activityIndicatorBackgroundView.centerYAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupSearchButton()
        setupNavigationBar()
        setupActivityIndicatorView()
        setupWelcomeLabel()
        setupTableView()
        setupLayout()
    }
}
