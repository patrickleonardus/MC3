//
//  BrowseJobVacancyTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 29/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class BrowseJobVacancyTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var inputViewJob: UIView!
    @IBOutlet weak var inputJobName: UILabel!
    @IBOutlet weak var inputJobSalary: UILabel!
    @IBOutlet weak var inputJobRole: UILabel!
    @IBOutlet weak var inputJobGender: UILabel!
    @IBOutlet weak var jobImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
