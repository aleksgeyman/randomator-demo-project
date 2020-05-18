//
//  SelectSceneVM.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

protocol SelectSceneDelegate: Coordinator {
    
}

class SelectSceneViewModel: SelectSceneViewModelProtocol {
    unowned private let delegate: SelectSceneDelegate
    
    init(delegate: SelectSceneDelegate) {
        self.delegate = delegate
    }
}
