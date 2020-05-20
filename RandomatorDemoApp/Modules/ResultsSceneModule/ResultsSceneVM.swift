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
    private var recentResultsRepository: RecentResultsRepositoryProtocol
    
    init(recentResultsRepository: RecentResultsRepositoryProtocol) {
        self.recentResultsRepository = recentResultsRepository
    }
    
    func start() {
        results.value = recentResultsRepository.getAllRecentResults(for: RandomComponents.number)
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
            resultData = ResultDataModel(value: 1, date: "Today")
        }
        
        return ViewConfigurator<ViewResultTableViewCell>(data: resultData)
    }
}
