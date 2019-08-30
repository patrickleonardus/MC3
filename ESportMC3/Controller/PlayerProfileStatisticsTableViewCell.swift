//
//  PlayerProfileStatisticsTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 31/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class PlayerProfileStatisticsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var viewWinrate: UIView!
    @IBOutlet weak var viewKills: UIView!
    @IBOutlet weak var viewDeaths: UIView!
    @IBOutlet weak var viewAssist: UIView!
    @IBOutlet weak var viewGold: UIView!
    @IBOutlet weak var viewXP: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
