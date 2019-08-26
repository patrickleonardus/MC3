//
//  TeamTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 21/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class HomeTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var clCollectionView: UICollectionView!
    
    var teams: [Team]? {
        didSet {
            self.updateView()
        }
    }
    
    var teamDidTapListener : TeamListener?
    
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

extension HomeTeamTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let teams = teams else {fatalError()}
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCollectionView", for: indexPath) as! TeamInsideCollectionViewCell
        guard
            let teams = teams
        else {fatalError()}
        let team = teams[indexPath.row]
        cell.lblNameCl.text = team.name
        cell.lblLocationCl.text = "⌾ " + team.location
        cell.imageTeamCl.image = UIImage(named: team.image)
        cell.imageTeamCl.layer.cornerRadius = cell.imageTeamCl.frame.height/2
        cell.imageTeamCl.layer.borderWidth = 1
        cell.imageTeamCl.layer.borderColor = UIColor.gray.cgColor
        
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
        guard let teams = teams else {fatalError()}
        teamDidTapListener?.didTap(team: teams[indexPath.row])
    }
    
}

