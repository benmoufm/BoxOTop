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
    private let searchBar = UISearchBar(frame: CGRect(x: 40, y: 100, width: 250, height: 100))

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

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationItem.title = "📺 Box Office"
        navigationController?.navigationBar.barTintColor = UIColor.green
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        searchBar.placeholder = "Search for a movie..."
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBar)
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
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupTableView()
        setupLayout()
    }
}
