//
//  TeamDetailController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 28/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class TeamDetailController: UIViewController {
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamLblName: UILabel!
    @IBOutlet weak var teamLblAlias: UILabel!
    @IBOutlet weak var teamLblLocation: UILabel!
    @IBOutlet weak var viewProfile: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var jobs: [Job]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        loadPlayerData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpUI(){
        teamImage.layer.cornerRadius = teamImage.frame.height/2
        teamImage.layer.borderColor = UIColor.black.cgColor
        teamImage.layer.borderWidth = 1
        
        
        viewProfile.layer.cornerRadius = 15
        viewProfile.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        tableView.separatorStyle = .none
    }
    
    func loadPlayerData(){
        teamImage.image =  UIImage(named: UserDefaults.standard.object(forKey: "imageForDetail") as! String) 
        teamLblName.text = (UserDefaults.standard.object(forKey: "nameForDetail") as! String)
        teamLblAlias.text = (UserDefaults.standard.object(forKey: "aliasForDetail") as! String)
        teamLblLocation.text = "⌾ " + (UserDefaults.standard.object(forKey: "locationForDetail") as! String)
    }
    
}

extension TeamDetailController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Team Profile"
        }
        else if section == 1 {
            return "Job Vacancy"
        }
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        jobs = Job.getJobs()
        
        var numberOfRows = 2
        
        if section == 0 {
            numberOfRows = 1
        }
        else if section == 1 {
            numberOfRows = jobs!.count
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 130
        }
        else if indexPath.section == 1 {
            return 165
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! TeamDetailProfileTableViewCell
            cell.lblDetail.text = (UserDefaults.standard.object(forKey: "descriptionForDetail") as! String)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statisticsCell") as! TeamDetailJobTableViewCell
            guard let jobs = jobs else {fatalError()}
            let job = jobs[indexPath.row]
            cell.lblJobName.text = job.name
            cell.lblJobRange.text = job.salary
            cell.lblJobRole.text = job.role
            cell.lblJobGender.text = job.gender
            cell.view.layer.cornerRadius = 8
            cell.view.layer.borderWidth = 1
            cell.view.layer.borderColor = UIColor.gray.cgColor
            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.masksToBounds = false
            cell.view.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.view.layer.shadowRadius = 6
            cell.view.layer.shadowOpacity = 0.5
            cell.view.layer.cornerRadius = 10
            cell.view.layer.masksToBounds = false
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.gray
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! TeamDetailProfileTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statisticsCell") as! TeamDetailJobTableViewCell
            
            guard let jobs = jobs else {fatalError()}
            let job = jobs[indexPath.row]
            let imageTemp = job.image
            let nameTemp = job.name
            let salaryTemp = job.salary
            let roleTemp = job.role
            let genderTemp = job.gender
            let contactTemp = job.contactPerson
            let requirementTemp = job.requirement
            let descTemp = job.description
            
            UserDefaults.standard.set(imageTemp, forKey: "imageJob")
            UserDefaults.standard.set(nameTemp, forKey: "nameJob")
            UserDefaults.standard.set(salaryTemp, forKey: "salaryJob")
            UserDefaults.standard.set(roleTemp, forKey: "roleJob")
            UserDefaults.standard.set(genderTemp, forKey: "genderJob")
            UserDefaults.standard.set(contactTemp, forKey: "contactJob")
            UserDefaults.standard.set(requirementTemp, forKey: "requirementJob")
            UserDefaults.standard.set(descTemp, forKey: "descJob")
        
            cell.selectionStyle = UITableViewCell.SelectionStyle.gray
            
            let viewController = storyboard?.instantiateViewController(withIdentifier: "jobDetail")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        
    }
    
}
