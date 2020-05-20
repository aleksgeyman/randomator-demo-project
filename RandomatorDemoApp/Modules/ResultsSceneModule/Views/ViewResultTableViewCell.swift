//
//  ViewResultTableViewCell.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class ViewResultTableViewCell: UITableViewCell, Configurable {

    @IBOutlet private weak var valueLabel: UILabel!
    
    func configure(with data: ResultDataModel) {
        valueLabel.text = "\(data.value)"
    }
}

struct ResultDataModel: ResultEntityModel {
    var value: String
    var date: String
}
