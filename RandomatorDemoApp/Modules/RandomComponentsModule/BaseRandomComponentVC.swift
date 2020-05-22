//
//  BaseRandomComponentVC.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 20.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import SimpleTwoWayBinding

protocol BaseRandomComponentSceneDelegate: Coordinator {
    func randomComponentSceneShouldReturnToSelectScene()
}

protocol BaseRandomComponentViewModelProtocol: class {
    var delegate: BaseRandomComponentSceneDelegate { get }
    var randomComponent: RandomComponents { get }
    var randomValue: Observable<String> { get }
    var recentResultsRepository: RecentResultsRepositoryProtocol { get }
    
    func generateRandomValue()
    func openSelectScene()
}

class BaseRandomComponentVC: UIViewController {
    
    var viewModel: BaseRandomComponentViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        configureReturnToSelectButton()
    }
    
    func setupBindings() {
        preconditionFailure("\(#function) should be overriden in child class!")
    }
    
    class func configureTabBarIcon() -> UITabBarItem {
        preconditionFailure("\(#function) should be overriden in child class!")
    }
    
    private func configureReturnToSelectButton() {
        let button = UIButton(frame: CGRect(x: 5, y: 44, width: 180, height: 40))
        button.setTitle("Select Component", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapOnReturnToSelectButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func didTapOnReturnToSelectButton() {
        viewModel.openSelectScene()
    }
}

// MARK: StoryboardInstantiatable
extension BaseRandomComponentVC: StoryboardInstantiatable {
    static var storyboardName: String {
        return "RandomComponents"
    }
}
