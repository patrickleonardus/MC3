//
//  PlayerDetailStatisticsTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 26/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class PlayerDetailStatisticsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var winrateView: UIView!
    @IBOutlet weak var killsView: UIView!
    @IBOutlet weak var deathsView: UIView!
    @IBOutlet weak var assistView: UIView!
    @IBOutlet weak var goldView: UIView!
    @IBOutlet weak var xpView: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
