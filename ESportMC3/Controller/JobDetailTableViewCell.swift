//
//  JobDetailTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 03/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class JobDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblImage: UIImageView!
    @IBOutlet weak var viewJob: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
