//
//  AppCoordinator.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        super.init()
        
        let navController = UINavigationController()
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
    
    override func start() {
        childCoordinators.first?.start()
    }
}
