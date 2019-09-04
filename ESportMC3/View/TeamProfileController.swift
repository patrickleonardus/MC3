//
//  TeamProfileController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 02/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class TeamProfileController: UIViewController {
    
    @IBOutlet weak var inputImage: UIImageView!
    @IBOutlet weak var inputName: UILabel!
    @IBOutlet weak var inputAlias: UILabel!
    @IBOutlet weak var inputLocation: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileBG: UIView!
    
     var jobs : [Job]?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func setUpUI(){
        setButton()
        tableView.tableFooterView = UIView()
        profileBG.layer.cornerRadius = 15
        profileBG.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    func loadData(){
        inputName.text = UserDefaults.standard.string(forKey: "nameTeam")
        inputAlias.text = UserDefaults.standard.string(forKey: "aliasTeam")
        inputLocation.text = "⌾ " + UserDefaults.standard.string(forKey: "cityTeam")!
        let data = UserDefaults.standard.object(forKey: "imageTeam") as! NSData
        inputImage.image = UIImage(data: data as Data)
        
    }
    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(submitAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
    }
    
    @objc func submitAction(){
        performSegue(withIdentifier: "goToEditProfileClub", sender: self)
    }
    
    @objc func addVacancy (){
        performSegue(withIdentifier: "addVacancy", sender: self)
    }
    
    

}


extension TeamProfileController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "About Team"
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
        
        var numberOfSection = 0
        jobs = Job.getJobs()
        
        if section == 0 {
            numberOfSection = 1
        }
        else if section == 1 {
            numberOfSection = jobs!.count
        }
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height : CGFloat = 0
        
        if indexPath.section == 0 {
            height = 200
        }
        else if indexPath.section == 1 {
            height = 180
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "descCell") as! TeamProfileViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.lblDetail.text = UserDefaults.standard.string(forKey: "descTeam")
            cell.lblYear.text = UserDefaults.standard.string(forKey: "yearTeam")
            
            return cell
        }
        else if indexPath.section == 1 {
            
            tableView.separatorStyle = .none
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "jobTeamCell") as! JobDetailTableViewCell
            
            jobs = Job.getJobs()
            guard let jobs = jobs else {fatalError()}
            let job = jobs[indexPath.row]
            
            cell.lblName.text = job.name
            cell.lblRole.text = job.role
            cell.lblGender.text = job.gender
            cell.lblSalary.text = job.salary
            cell.lblImage.image = UIImage(named: job.image!)
            cell.lblImage.layer.cornerRadius = cell.lblImage.frame.height/2
            cell.lblImage.layer.borderWidth = 1
            cell.lblImage.layer.borderColor = UIColor.lightGray.cgColor
            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.masksToBounds = false
            cell.viewJob.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.viewJob.layer.shadowRadius = 6
            cell.viewJob.layer.shadowOpacity = 0.5
            cell.viewJob.layer.cornerRadius = 10
            cell.viewJob.layer.masksToBounds = false
            
            cell.viewJob.layer.cornerRadius = 8
            cell.viewJob.layer.borderColor = UIColor.gray.cgColor
            cell.viewJob.layer.borderWidth = 1
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            
            let frame: CGRect = tableView.frame
            
            let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
            label.text = "About Team"
            label.font = UIFont.boldSystemFont(ofSize: 17)
            
            let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
            headerView.addSubview(label)
            return headerView
            
        }
        
        else if section == 1 {
            
            let frame: CGRect = tableView.frame
            
            let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
            label.text = "Vacancies"
            label.font = UIFont.boldSystemFont(ofSize: 17)
            
            let btnBrowse: UIButton = UIButton(frame: CGRect(x: frame.size.width - 160, y: 0, width: 160, height: 28))
            btnBrowse.setTitle("Add new vacancy ›", for: [])
            btnBrowse.setTitleColor(Colors().mainRed, for: [])
            btnBrowse.titleLabel!.font = UIFont.systemFont(ofSize: 15.0)
            btnBrowse.addTarget(self, action: #selector(addVacancy), for: .touchUpInside)
            
            let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
            headerView.addSubview(btnBrowse)
            headerView.addSubview(label)
            return headerView
            
        }
        
        return UIView()
        
    }
}
