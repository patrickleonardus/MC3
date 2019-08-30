//
//  PlayerDetailController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 20/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class PlayerDetailController: UIViewController {

    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var usernameDetail: UILabel!
    @IBOutlet weak var locationDetail: UILabel!
    
    @IBOutlet weak var profileBGView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnHireNow: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPlayerData()
        setUpUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func loadPlayerData(){
        imageDetail.image = UIImage(named: UserDefaults.standard.object(forKey: "imageForDetail") as! String)
        nameDetail.text = UserDefaults.standard.object(forKey: "nameForDetail") as? String
        usernameDetail.text = UserDefaults.standard.object(forKey: "userForDetail") as? String
        locationDetail.text = "⌾ " + (UserDefaults.standard.object(forKey: "locationForDetail") as! String)
    }
    
    func setUpUI(){
        imageDetail.layer.cornerRadius = imageDetail.frame.height/2
        imageDetail.layer.borderWidth = 1
        imageDetail.layer.borderColor = UIColor.gray.cgColor
        
        profileBGView.layer.cornerRadius = 15
        profileBGView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        btnHireNow.layer.shadowColor = UIColor.black.cgColor
        btnHireNow.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        btnHireNow.layer.shadowRadius = 8
        btnHireNow.layer.shadowOpacity = 1
        btnHireNow.layer.masksToBounds = false
        
    }

}

extension PlayerDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 295
        } else if indexPath.section == 1{
            return 750
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Profile"
        } else if section == 1 {
            return "Statistics"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailDescription") as! PlayerDetailProfileTableViewCell
            cell.lblPlayerDetail.text = UserDefaults.standard.object(forKey: "descriptionForDetail") as? String
            cell.lblPlayerAge.text = UserDefaults.standard.object(forKey: "ageForDetail") as? String
            cell.lblPlayerGender.text = UserDefaults.standard.object(forKey: "genderForDetail") as? String
            cell.lblPlayerRank.text = UserDefaults.standard.object(forKey: "rankForDetail") as? String
            return cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailStatistics") as! PlayerDetailStatisticsTableViewCell
            
            cell.winrateView.layer.cornerRadius = 8
            cell.killsView.layer.cornerRadius = 8
            cell.deathsView.layer.cornerRadius = 8
            cell.assistView.layer.cornerRadius = 8
            cell.goldView.layer.cornerRadius = 8
            cell.xpView.layer.cornerRadius = 8
            return cell
        }
        return UITableViewCell()
    }
    
    
}
