//
//  RouteCell.swift
//  CycleCredits
//
//  Created by Patrick Murphy on 01/04/2015.
//  Copyright (c) 2015 Patrick Murphy. All rights reserved.
//

import UIKit

class RouteCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var emissionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
