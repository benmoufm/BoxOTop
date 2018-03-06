//
//  SharedViewController.swift
//  BoxOTop
//
//  Created by Mélodie Benmouffek on 04/03/2018.
//  Copyright © 2018 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class SharedViewController: UIViewController, Loadable {

    // MARK: - Private properties

    private lazy var loadingView = LoadingView()

    // MARK: - Lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: - Loadable

    func displayLoading() {
        loadingView.displayLoading()
    }

    func hideLoading() {
        loadingView.hideLoading()
    }

    // MARK: - Private methods

    private func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.navigationBarTextColor
    }

    private func setupLayout() {
        view.addSubview(loadingView)
        loadingView.pinToSuperView(edges: .all, insets: .zero)
        loadingView.layer.zPosition = 1
    }

    private func setup() {
        setupNavigationItem()
    }
}