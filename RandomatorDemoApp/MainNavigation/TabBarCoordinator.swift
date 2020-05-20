//
//  TabBarCoordinator.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    private unowned let rootViewController: UITabBarController
    private let randomComponent: RandomComponents
    
    init(rootViewController: UITabBarController, randomComponent: RandomComponents) {
        self.rootViewController = rootViewController
        self.randomComponent = randomComponent
    }
    
    override func start() {
        let resultsVC = ResultsSceneVC.create(for: randomComponent)
        rootViewController.setViewControllers([randomComponent.controller, resultsVC], animated: true)
    }
}
