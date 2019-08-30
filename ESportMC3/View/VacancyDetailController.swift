//
//  VacancyDetailController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 29/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class VacancyDetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewProfile: UIView!
    
    
    @IBOutlet weak var jobImage: UIImageView!
    @IBOutlet weak var jobName: UILabel!
    @IBOutlet weak var jobRole: UILabel!
    @IBOutlet weak var jobSalary: UILabel!
    @IBOutlet weak var jobGender: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }
    
    func setUpUI(){
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        
        jobImage.layer.cornerRadius = jobImage.frame.height/2
        jobImage.layer.borderColor = UIColor.gray.cgColor
        jobImage.layer.borderWidth = 1
        
        viewProfile.layer.cornerRadius = 15
        viewProfile.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        tableView.separatorStyle = .none
    }
    
    
    func loadData(){
        jobImage.image = UIImage(named: UserDefaults.standard.object(forKey: "imageJob") as! String)
        jobName.text = (UserDefaults.standard.object(forKey: "nameJob") as! String)
        jobRole.text = (UserDefaults.standard.object(forKey: "roleJob") as! String)
        jobSalary.text = (UserDefaults.standard.object(forKey: "salaryJob") as! String)
        jobGender.text = (UserDefaults.standard.object(forKey: "genderJob") as! String)
    }
}


extension VacancyDetailController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightForRow : CGFloat  = 0
        
        if indexPath.section == 0 {
            heightForRow = 130
        }
        else if indexPath.section == 1 {
            heightForRow = 180
        }
        else if indexPath.section == 2 {
            heightForRow = 80
        }
        
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Job Description"
        }
        
        else if section == 1 {
            return "Requirement"
        }
        
        else if section == 2 {
            return "Contact Person"
        }
        
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "vacancyCell") as! VacancyDetailJobDescTableViewCell
            cell.inputText.text = (UserDefaults.standard.object(forKey: "descJob") as! String)
            return cell
        }
        
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "vacancyCell") as! VacancyDetailJobDescTableViewCell
            cell.inputText.text = (UserDefaults.standard.object(forKey: "requirementJob") as! String)
            return cell
        }
        
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "vacancyCell") as! VacancyDetailJobDescTableViewCell
            cell.inputText.text = (UserDefaults.standard.object(forKey: "contactJob") as! String)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
