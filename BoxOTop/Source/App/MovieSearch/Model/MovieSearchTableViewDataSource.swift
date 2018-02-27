//
//  MovieSearchTableViewDataSource.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 27/02/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class MovieSearchTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    var viewModel: MovieSearchTableViewModel = .empty

    // MARK: - MovieSearchTableViewDataSource

    func configure(_ tableView: UITableView) {

    }

    func update(with viewModel: MovieSearchTableViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
