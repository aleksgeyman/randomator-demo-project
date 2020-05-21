//
//  DiceResultTableViewCell.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 21.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class DiceResultTableViewCell: UITableViewCell, Configurable {

    @IBOutlet weak var valueView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(with data: ResultEntityModel) {
        valueView.image = UIImage(named: "dice" + data.value)
        dateLabel.text = data.date
    }
}
