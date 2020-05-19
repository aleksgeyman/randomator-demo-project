//
//  TabBarVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: StoryboardInstantiatable
extension TabBarVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "MainNavigation"
    }
}
