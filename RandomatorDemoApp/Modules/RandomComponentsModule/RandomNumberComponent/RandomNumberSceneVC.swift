//
//  RandomNumberVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTwoWayBinding

protocol RandomNumberSceneViewModelProtocol {
    var randomNumber: Observable<Int> { get }
    
    func generateRandomNumber()
}

class RandomNumberSceneVC: UIViewController {
    
    private var viewModel: RandomNumberSceneViewModelProtocol!
    @IBOutlet private weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    @IBAction private func didTapOnButton(_ sender: Any) {
        viewModel.generateRandomNumber()
    }
    
    private func setupBindings() {
        viewModel.randomNumber.bind { [weak self] _, value  in
            self?.numberLabel.text = "\(value)"
        }
    }
    
    private static func configureTabBarIcon() -> UITabBarItem {
        let image = UIImage(systemName: "number.square")
        return UITabBarItem(title: "Random Number", image: image, selectedImage: image)
    }
}

// MARK: Scene Factory
extension RandomNumberSceneVC {
    
    static func create() -> UIViewController {
        let viewController = Self.instantiateFromStoryboard()
        let viewModel = RandomNumberSceneViewModel(recentResultsRepository: RecentResultsRepository())
        viewController.viewModel = viewModel
        viewController.tabBarItem = configureTabBarIcon()
        return viewController
    }
}

// MARK: StoryboardInstantiatable
extension RandomNumberSceneVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "RandomComponents"
    }
}
