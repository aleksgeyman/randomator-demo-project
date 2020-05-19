//
//  Coordinator+AppCoordinator.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

extension Coordinator {
    var appCoordinator: AppSceneDelegate? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.appCoordinator
    }
}
