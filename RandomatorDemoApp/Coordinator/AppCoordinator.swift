//
//  AppCoordinator.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

protocol AppSceneDelegate: Coordinator {
    
    func shouldShowSelectScene()
    func shouldShowRandomComponentScene(_ randomComponent: RandomComponents)
}

class AppCoordinator: Coordinator {
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        super.init()
        configureSelectSceneCoordinator()
    }
    
    override func start() {
        childCoordinators.first?.start()
    }
    
    private func configureSelectSceneCoordinator() {
        let navController = UINavigationController()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        let childCoordinator = SelectSceneCoordinator(rootViewControler: navController)
        addChildCoordinator(childCoordinator)
    }
}

extension AppCoordinator: AppSceneDelegate {
    
    func shouldShowSelectScene() {
        configureSelectSceneCoordinator()
        start()
    }
    
    func shouldShowRandomComponentScene(_ randomComponent: RandomComponents) {
        let rootVC = TabBarVC.instantiateFromStoryboard()
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        let tabCoordinator = TabBarCoordinator(rootViewController: rootVC, randomComponent: randomComponent)
        addChildCoordinator(tabCoordinator)
        tabCoordinator.start()
    }
}
