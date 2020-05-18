//
//  SelectSceneVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

protocol SelectSceneViewModelProtocol: class {
    
}

class SelectSceneVC: UIViewController {
    
    private unowned var viewModel: SelectSceneViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
