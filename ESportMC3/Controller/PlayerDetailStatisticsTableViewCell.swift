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
    
    
    @IBOutlet weak var lblWinRate: UILabel!
    @IBOutlet weak var lblWin: UILabel!
    @IBOutlet weak var lblLose: UILabel!
    @IBOutlet weak var lblKill: UILabel!
    @IBOutlet weak var lblKillMax: UILabel!
    @IBOutlet weak var lblDeath: UILabel!
    @IBOutlet weak var lblDeathMax: UILabel!
    @IBOutlet weak var lblAssist: UILabel!
    @IBOutlet weak var lblAssistMax: UILabel!
    @IBOutlet weak var lblGoldPerMin: UILabel!
    @IBOutlet weak var lblGoldPerMinMax: UILabel!
    @IBOutlet weak var lblXpPerMin: UILabel!
    @IBOutlet weak var lblXpPerMinMax: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
