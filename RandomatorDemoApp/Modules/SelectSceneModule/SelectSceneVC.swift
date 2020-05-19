//
//  SelectSceneVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

protocol SelectSceneViewModelProtocol: Coordinatable, DataSource {
    
}

class SelectSceneVC: UIViewController {
    
    private var viewModel: SelectSceneViewModelProtocol! {
        didSet {
            viewModel.start()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(with: viewModel)
    }
}

// MARK: Scene Factory
extension SelectSceneVC {
    
    static func create(delegate: SelectSceneDelegate) -> UIViewController {
        let viewController = Self.instantiateFromStoryboard()
        let viewModel = SelectSceneViewModel(delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: StoryboardInstantiatable
extension SelectSceneVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "SelectScene"
    }
}

// MARK: UITableViewDataSource
extension SelectSceneVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = viewModel.viewConfigurator(at: indexPath.row, in: indexPath.section)
        return tableView.configureCell(for: configurator, at: indexPath)
    }
}

// MARK: UITableViewDelegate
extension SelectSceneVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.viewConfigurator(at: indexPath.row, in: indexPath.section).actionOnTap?()
    }
}
