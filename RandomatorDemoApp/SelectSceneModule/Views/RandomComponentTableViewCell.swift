//
//  RandomComponentTableViewCell.swift
//  RandomatorDemoApp
//
//  Created by Aleksandar Geyman on 18.05.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit

class RandomComponentTableViewCell: UITableViewCell, Configurable {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with data: RandomComponentModel) {
        titleLabel.text = data.title
    }
}

struct RandomComponentModel {
    var title: String
}
