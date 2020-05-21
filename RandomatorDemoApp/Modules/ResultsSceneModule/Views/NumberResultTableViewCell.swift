//
//  ViewResultTableViewCell.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 19.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class NumberResultTableViewCell: UITableViewCell, Configurable {

    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(with data: ResultEntityModel) {
        valueLabel.text = data.value
        dateLabel.text = data.date
    }
}

struct ResultDataModel: ResultEntityModel {
    var value: String
    var date: String
}
