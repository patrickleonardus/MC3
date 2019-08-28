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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var jobs = Job.getJobs()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        loadPlayerData()
        
    }
    
    func setUpUI(){
        teamImage.layer.cornerRadius = teamImage.frame.height/2
        teamImage.layer.borderColor = UIColor.black.cgColor
        teamImage.layer.borderWidth = 1
    }
    
    func loadPlayerData(){
        teamImage.image = (UserDefaults.standard.object(forKey: "imageForDetail") as! UIImage)
        teamLblName.text = (UserDefaults.standard.object(forKey: "nameForDetail") as! String)
        teamLblAlias.text = (UserDefaults.standard.object(forKey: "aliasForDetail") as! String)
        teamLblLocation.text = (UserDefaults.standard.object(forKey: "locationForDetail") as! String)
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
        
        var numberOfRows = 0
        
        if section == 0 {
            numberOfRows = 1
        }
        else if section == 1 {
            numberOfRows = jobs.count
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! TeamDetailProfileTableViewCell
            cell.lblDetail.text = (UserDefaults.standard.object(forKey: "descriptionForDetail") as! String)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statisticsCell") as! TeamDetailStatisticsTableViewCell
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
