//
//  RecentResultsRepository.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 20.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

private struct RecentResultsConstants {
    static let maxCount = 10
}

protocol RecentResultsRepositoryProtocol {
    
    func getAllRecentResults(for randomComponent: RandomComponents) -> [ResultDataModel]
    func addRecentResult(for randomComponent: RandomComponents, result: ResultEntityModel)
}

class RecentResultsRepository: RecentResultsRepositoryProtocol {
    private var userDefaultsRepository: UserDefaultsRepositoryProtocol
    
    init(userDefaultsRepository: UserDefaultsRepositoryProtocol = UserDefaultsRepository()) {
        self.userDefaultsRepository = userDefaultsRepository
    }
    
    func getAllRecentResults(for randomComponent: RandomComponents) -> [ResultDataModel] {
        return userDefaultsRepository.getObjectsArray(of: ResultDataModel.self, for: randomComponent.rawValue)
    }
    
    func addRecentResult(for randomComponent: RandomComponents, result: ResultEntityModel) {
        guard let result = result as? ResultDataModel else { return }
        
        var results = getAllRecentResults(for: randomComponent)
        if results.count >= RecentResultsConstants.maxCount {
            _ = results.popLast()
        }
        results.insert(result, at: 0)
        userDefaultsRepository.setObjectsArray(results, for: randomComponent.rawValue)
    }
}

protocol ResultEntityModel: Codable {
    var value: Int { get }
    var date: String { get }
}
