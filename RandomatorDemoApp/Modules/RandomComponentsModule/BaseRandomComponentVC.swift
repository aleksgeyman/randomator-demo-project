//
//  BaseRandomComponentVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 20.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTwoWayBinding

protocol BaseRandomComponentViewModelProtocol: class {
    var randomComponent: RandomComponents { get }
    var randomValue: Observable<String> { get }
    var recentResultsRepository: RecentResultsRepositoryProtocol { get }
    
    func generateRandomValue()
}

class BaseRandomComponentVC: UIViewController {
    
    var viewModel: BaseRandomComponentViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    func setupBindings() {
        preconditionFailure("\(#function) should be overriden in child class!")
    }
    
    class func configureTabBarIcon() -> UITabBarItem {
        preconditionFailure("\(#function) should be overriden in child class!")
    }
}

// MARK: StoryboardInstantiatable
extension BaseRandomComponentVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "RandomComponents"
    }
}
