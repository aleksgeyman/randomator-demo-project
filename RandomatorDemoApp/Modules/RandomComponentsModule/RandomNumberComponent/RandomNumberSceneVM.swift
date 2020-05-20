//
//  File.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

class RandomNumberSceneViewModel: BaseRandomComponentViewModelProtocol {
    var randomComponent: RandomComponents
    var randomValue = Observable<String>()
    var recentResultsRepository: RecentResultsRepositoryProtocol
    
    init(randomComponent: RandomComponents, recentResultsRepository: RecentResultsRepositoryProtocol) {
        self.randomComponent = randomComponent
        self.recentResultsRepository = recentResultsRepository
    }
}
