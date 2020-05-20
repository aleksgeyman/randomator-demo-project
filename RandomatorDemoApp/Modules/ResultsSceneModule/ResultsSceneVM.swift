//
//  ResultsSceneVM.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

class ResultsSceneViewModel: ResultsSceneViewModelProtocol {
    
    var results = Observable<[ResultEntityModel]>()
    private var randomComponent: RandomComponents
    private var recentResultsRepository: RecentResultsRepositoryProtocol
    
    init(randomComponent: RandomComponents, recentResultsRepository: RecentResultsRepositoryProtocol) {
        self.randomComponent = randomComponent
        self.recentResultsRepository = recentResultsRepository
    }
    
    func start() {
        results.value = recentResultsRepository.getAllRecentResults(for: randomComponent)
    }
    
    // MARK: DataSource
    var reuseIdentifiers: [String] {
        return ["\(ViewResultTableViewCell.self)"]
    }
    
    var sectionsNumber: Int {
        return 1
    }
    
    func numberOfCells(in section: Int) -> Int {
        return results.value?.count ?? 0
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> Configurator {
        let resultData: ResultDataModel
        if let result = results.value?[index] as? ResultDataModel {
            resultData = result
        } else {
            resultData = ResultDataModel(value: "one", date: "Today")
        }
        
        return ViewConfigurator<ViewResultTableViewCell>(data: resultData)
    }
}
