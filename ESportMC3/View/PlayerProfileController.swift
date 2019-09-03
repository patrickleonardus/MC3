//
//  PlayerProfileController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 31/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class PlayerProfileController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var profileLocation: UILabel!
    
    
    @IBOutlet weak var viewUserValidation: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileBG: UIView!
    
    
    let validation = UserDefaults.standard.bool(forKey: "userCheck")

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userCheck()
    }
    
    func setUpUI(){
        tableView.allowsSelection = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.borderWidth = 1
        
        profileBG.layer.cornerRadius = 15
        profileBG.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func setUpButton(){
         let btnSubmit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(submitAction))
        navigationItem.rightBarButtonItem = btnSubmit
    }
    
    @objc func submitAction (){
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
    
    func userCheck(){
        
        if validation {
            
            setUpButton()
            
            navigationItem.title = "Player Profile"
            
            viewUserValidation.alpha = 0
            
            let data = UserDefaults.standard.object(forKey: "imagePlayer") as! NSData
            profileImage.image = UIImage(data: data as Data)
            profileName.text = UserDefaults.standard.string(forKey: "fullnamePlayer")
            profileUsername.text = UserDefaults.standard.string(forKey: "usernamePlayer")
            profileLocation.text = "⌾ " + UserDefaults.standard.string(forKey: "cityPlayer")!
            
        }
        else if validation == false {
            
            navigationItem.title = "Profile"
            
            viewUserValidation.alpha = 1
            
            let alert = UIAlertController(title: nil, message: "To see and manage your profile you need to login first or create an account if you don't have it before", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action:UIAlertAction!) in
                self.performSegue(withIdentifier: "goToLoginPage", sender: self)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
        }
        
    }
    
    func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "goToLoginPage", sender: self)
    }
    
}

extension PlayerProfileController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "My Profile"
        }
        
        else if section == 1 {
            return "Statistics"
        }
        
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var heightForRow : CGFloat = 0
        
        if indexPath.section == 0 {
            heightForRow = 250
        }
        
        else if indexPath.section == 1 {
            heightForRow = 690
        }
        
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if validation {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellAbout") as! PlayerProfileAboutMeTableViewCell
                
                cell.lblAbout.text = UserDefaults.standard.string(forKey: "descPlayer")
                cell.lblAge.text = String(calcAge(birthday: UserDefaults.standard.string(forKey: "dobPlayer")!))
                cell.lblGender.text = UserDefaults.standard.string(forKey: "genderPlayer")
                cell.lblRank.text = "Divine"
                
                
                return cell
            }
                
            else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellStatistics") as! PlayerProfileStatisticsTableViewCell
                
                cell.viewWinrate.layer.cornerRadius = 8
                cell.viewKills.layer.cornerRadius = 8
                cell.viewDeaths.layer.cornerRadius = 8
                cell.viewAssist.layer.cornerRadius = 8
                cell.viewGold.layer.cornerRadius = 8
                cell.viewXP.layer.cornerRadius = 8
                
                return cell
            }
        }
        
        return UITableViewCell()
       
    }
    
    
}
