//
//  SelectSceneVM.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

protocol SelectSceneDelegate: Coordinator {
    
}

class SelectSceneViewModel: SelectSceneViewModelProtocol {
    typealias RandomComponentCellConfigurator = ViewConfigurator<RandomComponentTableViewCell>
    unowned private let delegate: SelectSceneDelegate
    
    init(delegate: SelectSceneDelegate) {
        self.delegate = delegate
    }
    
    // MARK: DataSource
    var reuseIdentifiers: [String] {
        return ["\(RandomComponentTableViewCell.self)"]
    }
    
    var sectionsNumber: Int {
        return 1
    }
    
    func numberOfCells(in section: Int) -> Int {
        return 5
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> Configurator {
        return RandomComponentCellConfigurator(data: RandomComponentModel(title: "ABC"))
    }
}
