//
//  SelectSceneCoordinator.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class SelectSceneCoordinator: Coordinator {
    private unowned let rootViewController: UINavigationController
    
    init(rootViewControler: UINavigationController) {
        self.rootViewController = rootViewControler
    }
    
    override func start() {
        let viewController = SelectSceneVC.create(delegate: self)
        rootViewController.pushViewController(viewController, animated: true)
    }
}

extension SelectSceneCoordinator: SelectSceneDelegate {
    
    func selectionSceneShouldContinueTo(_ randomComponentIndex: Int) {
        
    }
}
