//
//  DiceSceneVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 20.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTwoWayBinding

class DiceSceneVC: BaseRandomComponentVC {
    
    @IBOutlet weak var diceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupBindings() {
        viewModel.randomValue.bind { [weak self] _, value in
            let imageName = "dice" + value
            self?.diceButton.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    @IBAction func didTapOnDiceButton(_ sender: Any) {
        viewModel.generateRandomValue()
    }
    
    override class func configureTabBarIcon() -> UITabBarItem {
        let image = UIImage(named: "dice")
        return UITabBarItem(title: "", image: image, selectedImage: image)
    }
}

// MARK: Scene Factory
extension DiceSceneVC {
    
    static func create(delegate: BaseRandomComponentSceneDelegate) -> UIViewController {
        let viewController = Self.instantiateFromStoryboard()
        viewController.viewModel = RandomNumberSceneViewModel(randomComponent: RandomComponents.dice,
                                                              recentResultsRepository: RecentResultsRepository(),
                                                              delegate: delegate)
        viewController.tabBarItem = configureTabBarIcon()
        return viewController
    }
}
