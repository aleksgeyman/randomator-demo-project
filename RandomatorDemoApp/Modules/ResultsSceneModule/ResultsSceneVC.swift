//
//  ResultsSceneVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTwoWayBinding

protocol ResultsSceneViewModelProtocol: Coordinatable, DataSource {
    var results: Observable<[ResultEntityModel]> { get }
}

class ResultsSceneVC: UIViewController {
    
    private var viewModel: ResultsSceneViewModelProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(with: viewModel)
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.results.bind { [weak self] _, _ in
            self?.tableView.reloadData()
        }
    }
    
    private static func configureTabBarIcon() -> UITabBarItem {
        let image = UIImage(systemName: "list.bullet")
        return UITabBarItem(title: "Results", image: image, selectedImage: image)
    }
}

// MARK: Scene Factory
extension ResultsSceneVC {
    
    static func create() -> UIViewController {
        let viewController = Self.instantiateFromStoryboard()
        let viewModel = ResultsSceneViewModel(recentResultsRepository: RecentResultsRepository())
        viewController.viewModel = viewModel
        viewController.tabBarItem = configureTabBarIcon()
        return viewController
    }
}

// MARK: StoryboardInstantiatable
extension ResultsSceneVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "ResultsScene"
    }
}

// MARK: UITableViewDataSource
extension ResultsSceneVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = viewModel.viewConfigurator(at: indexPath.row, in: indexPath.section)
        return tableView.configureCell(for: configurator, at: indexPath)
    }
}
