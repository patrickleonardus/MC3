//
//  HomeJobTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 21/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class HomeJobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clCollectionView: UICollectionView!
    
    var jobs: [Job]? {
        didSet {
            self.updateView()
        }
    }
    
    var jobDidTapListener : JobListener?

    
    func updateView(){
        clCollectionView.delegate = self
        clCollectionView.dataSource = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeJobTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard  let jobs = jobs else {
            fatalError()
        }
        return jobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "jobCollectionView", for: indexPath) as! JobInsideCollectionViewCell
        guard let jobs = jobs else {
            fatalError()
        }
        
        let job = jobs[indexPath.row]
        cell.lblTeamNameCl.text = job.name
        cell.lblTeamSalaryCl.text = job.salary
        cell.lblTeamRoleCl.text = "Role : " + job.role
        cell.lblTeamGenderCl.text = "Gender : " + job.gender
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        cell.layer.shadowRadius = 2.5
        cell.layer.shadowOpacity = 0.8
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let jobs = jobs else {fatalError()}
        jobDidTapListener?.didTap(job: jobs[indexPath.row])
    }
    
    
}
