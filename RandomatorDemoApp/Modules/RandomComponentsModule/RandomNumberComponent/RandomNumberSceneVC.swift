//
//  RandomNumberVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

protocol RandomNumberSceneViewModelProtocol {
    
}

class RandomNumberSceneVC: UIViewController {
    
    private var viewModel: RandomNumberSceneViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: Scene Factory
extension RandomNumberSceneVC {
    
    static func create() -> UIViewController {
        let viewController = Self.instantiateFromStoryboard()
        let viewModel = RandomNumberSceneViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: StoryboardInstantiatable
extension RandomNumberSceneVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "RandomComponents"
    }
}
