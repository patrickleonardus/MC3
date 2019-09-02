//
//  TeamDetailJobTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 28/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class TeamDetailJobTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblJobName: UILabel!
    @IBOutlet weak var lblJobRange: UILabel!
    @IBOutlet weak var lblJobRole: UILabel!
    @IBOutlet weak var lblJobGender: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
