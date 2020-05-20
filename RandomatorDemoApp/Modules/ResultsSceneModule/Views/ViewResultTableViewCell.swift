//
//  ViewResultTableViewCell.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class ViewResultTableViewCell: UITableViewCell, Configurable {

    func configure(with data: ResultDataModel) {
        
    }
}

struct ResultDataModel: ResultEntityModel {
    var value: Int
    var date: String
}
