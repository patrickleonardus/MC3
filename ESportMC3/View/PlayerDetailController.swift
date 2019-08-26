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
    @IBOutlet weak var ageDetail: UILabel!
    @IBOutlet weak var genderDetail: UILabel!
    
    @IBOutlet weak var profileBGView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
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
        nameDetail.text = UserDefaults.standard.object(forKey: "nameForDetail") as! String
        usernameDetail.text = UserDefaults.standard.object(forKey: "userForDetail") as! String
        ageDetail.text = String(UserDefaults.standard.integer(forKey: "ageForDetail"))
        genderDetail.text = UserDefaults.standard.object(forKey: "genderForDetail") as! String
        locationDetail.text = "⌾ " + (UserDefaults.standard.object(forKey: "locationForDetail") as! String)
    }
    
    func setUpUI(){
        imageDetail.layer.cornerRadius = imageDetail.frame.height/2
        imageDetail.layer.borderWidth = 1
        imageDetail.layer.borderColor = UIColor.gray.cgColor
        
        profileBGView.layer.cornerRadius = 15
        profileBGView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }

}

extension PlayerDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else if indexPath.section == 1{
            return 400
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
            return "Detail"
        } else if section == 1 {
            return "Statistics"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailDescription") as! PlayerDetailTableViewCell
            //cell?.textLabel?.text = UserDefaults.standard.object(forKey: "descriptionForDetail") as! String
            cell.lblPlayerDetail.text = UserDefaults.standard.object(forKey: "descriptionForDetail") as! String
            //cell?.textLabel?.sizeToFit()
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailStatistics") // as! NAMA CLASS CELL
            cell?.textLabel?.text = "statistics"
            return cell!
        }
        return UITableViewCell()
    }
    
    
}
