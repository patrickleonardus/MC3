//
//  PlayerDetailTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 22/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class PlayerDetailProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblPlayerDetail: UILabel!
    @IBOutlet weak var lblPlayerAge: UILabel!
    @IBOutlet weak var lblPlayerGender: UILabel!
    @IBOutlet weak var lblPlayerRank: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
