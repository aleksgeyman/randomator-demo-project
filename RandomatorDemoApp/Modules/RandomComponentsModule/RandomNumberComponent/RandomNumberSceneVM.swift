//
//  File.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

private struct RandomNumberValues {
    static let minValue = 0
    static let maxValue = 100
}

class RandomNumberSceneViewModel: RandomNumberSceneViewModelProtocol {
    var randomNumber = Observable<Int>()
    private var recentResultsRepository: RecentResultsRepositoryProtocol
    
    init(recentResultsRepository: RecentResultsRepositoryProtocol) {
        self.recentResultsRepository = recentResultsRepository
    }
    
    func generateRandomNumber() {
        let number = Int.random(in: RandomNumberValues.minValue...RandomNumberValues.maxValue)
        randomNumber.value = number
        saveResult(result: number)
    }
    
    private func saveResult(result: Int) {
        let result = ResultDataModel(value: result, date: "Today")
        recentResultsRepository.addRecentResult(for: RandomComponents.number, result: result)
    }
}
