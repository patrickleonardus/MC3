//
//  SearchTeamTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 25/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class SearchTeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageSearch: UIImageView!
    @IBOutlet weak var nameSearch: UILabel!
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
