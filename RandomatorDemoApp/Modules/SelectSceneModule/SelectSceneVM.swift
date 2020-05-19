//
//  SelectSceneVM.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

protocol SelectSceneDelegate: Coordinator {
    func selectionSceneShouldContinueTo(_ randomComponent: RandomComponents)
}

class SelectSceneViewModel: SelectSceneViewModelProtocol {
    typealias RandomComponentCellConfigurator = ViewConfigurator<RandomComponentTableViewCell>
    unowned private let delegate: SelectSceneDelegate
    private var components: [RandomComponents]!
    
    init(delegate: SelectSceneDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Coordinatable
    func start() {
        components = RandomComponents.allCases
    }
    
    // MARK: DataSource
    var reuseIdentifiers: [String] {
        return ["\(RandomComponentTableViewCell.self)"]
    }
    
    var sectionsNumber: Int {
        return 1
    }
    
    func numberOfCells(in section: Int) -> Int {
        return components.count
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> Configurator {
        let dataModel = RandomComponentModel(title: components[index].rawValue)
        let actionOnTap = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate.selectionSceneShouldContinueTo(strongSelf.components[index])
        }
        
        return RandomComponentCellConfigurator(data: dataModel, actionOnTap: actionOnTap)
    }
}
