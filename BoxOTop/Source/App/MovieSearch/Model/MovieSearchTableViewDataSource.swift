//
//  MovieSearchTableViewDataSource.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

protocol MovieSearchTableViewDataSourceDelegate: class {
    func loadMoreCells()
}

class MovieSearchTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var viewModel: MovieSearchTableViewModel = .empty
    weak var delegate: MovieSearchTableViewDataSourceDelegate?

    // MARK: - MovieSearchTableViewDataSource

    func configure(_ tableView: UITableView) {
        tableView.register(class: MovieTableViewCell.self)
        tableView.register(class: LoadTableViewCell.self)
    }

    func update(with viewModel: MovieSearchTableViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cells[indexPath.row]
        switch cellViewModel {
        case .movieCell(let movieCellViewModel):
            let cell: MovieTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: movieCellViewModel)
            colorCell(cell, at: indexPath)
            return cell
        case .loadCell:
            let cell: LoadTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.hideLoading()
            colorCell(cell, at: indexPath)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.cells[indexPath.row] {
        case .movieCell:
            return 130
        case .loadCell:
            return 50
        }
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = viewModel.cells[indexPath.row]
        switch cellViewModel {
        case .loadCell:
            guard let cell = tableView.cellForRow(at: indexPath) as? LoadTableViewCell else { return }
            cell.displayLoading()
            delegate?.loadMoreCells()
        case .movieCell:
            // TODO (Mélodie Benmouffek) 01/03/2018 When movie cell selected do
            break
        }
    }

    // MARK: - Private methods

    private func colorCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor.unevenMovieSearchTableViewCellColor
        } else {
            cell.backgroundColor = UIColor.evenMovieSearchTableViewCellColor
        }
    }
}
