//
//  MovieSearchViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 26/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, MovieSearchViewContract {

    var presenter: MovieSearchPresenter?

    // MARK: - Private properties

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

    // MARK: - Action methods

    @objc func toggleSearchBarDown() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a movie..."
        navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        (navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField)?.textColor = UIColor.navigationBarTextColor
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

    private func setupTableView() {
        dataSource.configure(tableView)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }

    private func setupLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupSearchButton()
        setupNavigationBar()
        setupTableView()
        setupLayout()
    }
}
