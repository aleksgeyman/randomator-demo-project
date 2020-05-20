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
    
    func generateRandomNumber() {
        randomNumber.value = Int.random(in: RandomNumberValues.minValue...RandomNumberValues.maxValue)
    }
}
