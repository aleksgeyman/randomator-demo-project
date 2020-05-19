//
//  TabBarVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTabBarAnimations

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
    }
}

// MARK: StoryboardInstantiatable
extension TabBarVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "MainNavigation"
    }
}

// MARK: SimpleTabBarAnimation
extension TabBarVC: SimpleTabBarAnimation {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        playAnimation(type: .rotate, for: item)
    }
}
