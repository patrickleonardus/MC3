//
//  CustomCellJob.swift
//  esportMC3
//
//  Created by Aditya Sanjaya on 26/08/19.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class CustomCellJob: UITableViewCell {
    
    var subject : String?
    var descrip : String?
    var status : String?
    var date : String?
    
    var subjectView : UILabel = {
        var labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    var descripView : UILabel = {
        var labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        return labelView
    }()
    
    var statusView : UILabel = {
        var labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = labelView.font.withSize(14)
        labelView.textColor = #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)
        return labelView
    }()
    
    var dateView : UILabel = {
        var labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.6156862745, alpha: 1)
        return labelView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        self.addSubview(subjectView)
        self.addSubview(descripView)
        self.addSubview(statusView)
        self.addSubview(dateView)
        
        subjectView.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 400, height: 20))
        
        descripView.anchor(top: self.subjectView.bottomAnchor, leading: self.subjectView.leadingAnchor, bottom: self.statusView.topAnchor, trailing: self.subjectView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 40), size: .init(width: 400, height: 0))
        descripView.heightAnchor.constraint(equalTo: self.subjectView.heightAnchor).isActive = true
        
        dateView.anchor(top: self.subjectView.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 0))
        dateView.heightAnchor.constraint(equalTo: self.subjectView.heightAnchor).isActive = true
        
        statusView.anchor(top: nil, leading: self.subjectView.leadingAnchor, bottom: nil, trailing: self.subjectView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 400, height: 0))
        statusView.heightAnchor.constraint(equalTo: self.subjectView.heightAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let subject = subject {
            subjectView.text = subject
        }
        if let status = status {
            statusView.text = status
        }
        if let date = date {
            dateView.text = date
        }
        if let descrip = descrip {
            descripView.text = descrip
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
