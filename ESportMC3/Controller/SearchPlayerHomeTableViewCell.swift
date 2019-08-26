//
//  PlayerSearchHomeTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 24/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class SearchPlayerHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSearch: UIImageView!
    @IBOutlet weak var nameSearch: UILabel!
    @IBOutlet weak var usernameSearch: UILabel!
    @IBOutlet weak var locationSearch: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
