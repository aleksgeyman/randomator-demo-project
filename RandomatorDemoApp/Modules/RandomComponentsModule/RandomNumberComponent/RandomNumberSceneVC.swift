//
//  RandomNumberVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTwoWayBinding

class RandomNumberSceneVC: BaseRandomComponentVC {
    
    @IBOutlet private weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapOnButton(_ sender: Any) {
        viewModel.generateRandomValue()
    }
    
    override func setupBindings() {
        viewModel.randomValue.bind { [weak self] _, value  in
            self?.numberLabel.text = "\(value)"
        }
    }
    
    override class func configureTabBarIcon() -> UITabBarItem {
        let image = UIImage(systemName: "number.square")
        return UITabBarItem(title: "Random Number", image: image, selectedImage: image)
    }
}

// MARK: Scene Factory
extension RandomNumberSceneVC {
    
    static func create(delegate: BaseRandomComponentSceneDelegate) -> UIViewController {
        let viewController = Self.instantiateFromStoryboard()
        viewController.viewModel = RandomNumberSceneViewModel(randomComponent: RandomComponents.number,
                                                              recentResultsRepository: RecentResultsRepository(),
                                                              delegate: delegate)
        viewController.tabBarItem = configureTabBarIcon()
        return viewController
    }
}
