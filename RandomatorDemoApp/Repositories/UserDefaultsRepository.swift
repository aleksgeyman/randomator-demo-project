//
//  UserDefaultsRepository.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 20.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation

protocol UserDefaultsRepositoryProtocol {
    
    func getObjectsArray<T: Codable>(of type: T.Type, for key: String) -> [T]
    func setObjectsArray<T: Codable>(_ value: [T], for key: String)
}

class UserDefaultsRepository: UserDefaultsRepositoryProtocol {
    
    func getObjectsArray<T: Codable>(of type: T.Type, for key: String) -> [T] {
        let objects: [T]
        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            objects = (try? decoder.decode(Array.self, from: data) as [T]) ?? []
        } else {
            objects = []
        }
        
        return objects
    }
    
    func setObjectsArray<T: Codable>(_ value: [T], for key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
