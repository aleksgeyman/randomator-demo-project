//
//  BaseRandomComponentVM.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 20.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

private struct RandomNumberValues {
    static let minValue = 0
    static let maxValue = 100
}

extension BaseRandomComponentViewModelProtocol {
    
    func generateRandomValue() {
        let minValue: Int
        let maxValue: Int
        switch randomComponent {
        case .dice:
            minValue = 1
            maxValue = 6
        default:
            minValue = RandomNumberValues.minValue
            maxValue = RandomNumberValues.maxValue
        }
        
        let value = Int.random(in: minValue...maxValue)
        let valueAsString = "\(value)"
        randomValue.value = valueAsString
        saveResult(result: valueAsString)
    }
    
    private func saveResult(result: String) {
        let result = ResultDataModel(value: result, date: getCurrentTime())
        recentResultsRepository.addRecentResult(for: randomComponent, result: result)
    }
    
    private func getCurrentTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: date)
    }
}
