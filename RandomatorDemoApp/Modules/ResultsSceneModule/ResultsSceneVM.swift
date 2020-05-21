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
    typealias numberCellConfigurator = ViewConfigurator<NumberResultTableViewCell>
    typealias diceCellConfigurator = ViewConfigurator<DiceResultTableViewCell>
    
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
        return ["\(NumberResultTableViewCell.self)", "\(DiceResultTableViewCell.self)"]
    }
    
    var sectionsNumber: Int {
        return 1
    }
    
    func numberOfCells(in section: Int) -> Int {
        return results.value?.count ?? 0
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> Configurator {
        let resultData: ResultDataModel
        let viewConfigurator: Configurator
        if let result = results.value?[index] as? ResultDataModel {
            resultData = result
        } else {
            resultData = ResultDataModel(value: "", date: "")
        }
        
        switch randomComponent {
        case .dice:
            viewConfigurator = diceCellConfigurator(data: resultData)
        default:
            viewConfigurator = numberCellConfigurator(data: resultData)
        }
        
        return viewConfigurator
    }
}
