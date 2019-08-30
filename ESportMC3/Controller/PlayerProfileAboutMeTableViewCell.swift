//
//  PlayerProfileTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 31/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class PlayerProfileAboutMeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblRank: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
