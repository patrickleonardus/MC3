//
//  HomeMainTableViewCell.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 21/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class HomePlayerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var clCollectionView: UICollectionView!
    
    var players: [Player]? {
        didSet {
            self.updateView()
        }
    }
    var playerDidTapListener: PlayerListener?
    
    
    func updateView() {
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

extension HomePlayerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let players = players else {fatalError()}
        return players!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCollectionView", for: indexPath) as! PlayerInsideCollectionViewCell
        guard
            let players = players
        else {fatalError()}
        let player = players[indexPath.row]
        
        
        cell.lblPlayerCL.text = player.name
        cell.lblLocationCl.text = "⌾ " + player.location
        cell.lblStatusCl.text = player.jobAvailability
        
        if(cell.lblStatusCl.text == "Available"){
            cell.lblStatusCl.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        else {
           cell.lblStatusCl.textColor = UIColor.red
        }
        
        cell.imagePlayerCL.image = UIImage(named: player.image)
        
        cell.imagePlayerCL.layer.cornerRadius = cell.imagePlayerCL.frame.height/2
        cell.imagePlayerCL.layer.borderWidth = 1
        cell.imagePlayerCL.layer.borderColor = UIColor.gray.cgColor
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = false
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
        guard let players = players else {fatalError()}
        playerDidTapListener?.didTap(player: players[indexPath.row])
    }
}
