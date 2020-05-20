//
//  ResultsSceneVM.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

class ResultsSceneViewModel: ResultsSceneViewModelProtocol {
    
    func start() {
        
    }
    
    // MARK: DataSource
    var reuseIdentifiers: [String] {
        return ["\(ViewResultTableViewCell.self)"]
    }
    
    var sectionsNumber: Int {
        return 1
    }
    
    func numberOfCells(in section: Int) -> Int {
        return 1
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> Configurator {
        return ViewConfigurator<ViewResultTableViewCell>(data: ResultDataModel(value: 1, date: "1"))
    }
}
