//
//  RandomComponentsEnum.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

enum RandomComponents: String, CaseIterable {
    case number = "Random Number"
    case dice = "Roll Dice"
    case quote = "Random Quote"
    
    func createControllerWith(_ delegate: BaseRandomComponentSceneDelegate) -> UIViewController {
        let vc: UIViewController
        switch self {
        case .number:
            vc = RandomNumberSceneVC.create(delegate: delegate)
        case .dice:
            vc = DiceSceneVC.create(delegate: delegate)
        default:
            vc = UIViewController()
        }
        return vc
    }
}
