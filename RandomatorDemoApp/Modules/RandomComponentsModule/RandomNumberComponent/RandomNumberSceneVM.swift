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
    unowned let delegate: BaseRandomComponentSceneDelegate
    let randomComponent: RandomComponents
    let randomValue = Observable<String>()
    let recentResultsRepository: RecentResultsRepositoryProtocol
    
    init(randomComponent: RandomComponents,
         recentResultsRepository: RecentResultsRepositoryProtocol,
         delegate: BaseRandomComponentSceneDelegate) {
        self.randomComponent = randomComponent
        self.recentResultsRepository = recentResultsRepository
        self.delegate = delegate
    }
}
