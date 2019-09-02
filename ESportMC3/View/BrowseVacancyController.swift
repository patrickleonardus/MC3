//
//  BrowseVacancyController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 29/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class BrowseVacancyController: UIViewController {
    
    var jobs : [Job]?
    var jobsFilter : [Job]?
    
    var searching = false
    
    @IBOutlet weak var tableViewJob: UITableView!
    
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         tabBarController?.tabBar.isHidden = false
    }
    
    func setUpUI(){
        tableViewJob.separatorStyle = .none
        setUpSearchBar()
    }
    
   
}

extension BrowseVacancyController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        jobs = Job.getJobs()
        
        var numberOfRows = 0
        
        if searching {
            numberOfRows = jobsFilter!.count
        }
        else if searching == false {
            numberOfRows = jobs!.count
        }
        
        
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell") as! BrowseJobVacancyTableViewCell
        
        if searching == false {
            
            jobsFilter = Job.getJobs()
            guard let jobs = jobs else {fatalError()}
            let job = jobs[indexPath.row]
            
            cell.inputJobName.text = job.name
            cell.inputJobRole.text = job.role
            cell.inputJobGender.text = job.gender
            cell.inputJobSalary.text = job.salary
            cell.jobImage.image = UIImage(named: job.image!)
            cell.jobImage.layer.cornerRadius = cell.jobImage.frame.height/2
            cell.jobImage.layer.borderWidth = 1
            cell.jobImage.layer.borderColor = UIColor.lightGray.cgColor
            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.masksToBounds = false
            cell.inputViewJob.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.inputViewJob.layer.shadowRadius = 6
            cell.inputViewJob.layer.shadowOpacity = 0.5
            cell.inputViewJob.layer.cornerRadius = 10
            cell.inputViewJob.layer.masksToBounds = false

            cell.inputViewJob.layer.cornerRadius = 8
            cell.inputViewJob.layer.borderColor = UIColor.gray.cgColor
            cell.inputViewJob.layer.borderWidth = 1
            
            return cell
        }
        
        else if searching == true {
            
            guard let jobsFilter = jobsFilter else {fatalError()}
            let job = jobsFilter[indexPath.row]
            
            cell.inputJobName.text = job.name
            cell.inputJobRole.text = job.role
            cell.inputJobGender.text = job.gender
            cell.inputJobSalary.text = job.salary
            cell.jobImage.image = UIImage(named: job.image!)
            cell.jobImage.layer.cornerRadius = cell.jobImage.frame.height/2
            cell.jobImage.layer.borderWidth = 1
            cell.jobImage.layer.borderColor = UIColor.lightGray.cgColor
            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.masksToBounds = false
            cell.inputViewJob.layer.shadowOffset = CGSize(width: 0, height: 1)
            cell.inputViewJob.layer.shadowRadius = 6
            cell.inputViewJob.layer.shadowOpacity = 0.5
            cell.inputViewJob.layer.cornerRadius = 10
            cell.inputViewJob.layer.masksToBounds = false

            cell.inputViewJob.layer.cornerRadius = 8
            cell.inputViewJob.layer.borderColor = UIColor.gray.cgColor
            cell.inputViewJob.layer.borderWidth = 1
            
            return cell
        }
        
      return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if searching == false{
            let jobs = Job.getJobs()
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
            
            let viewController = storyboard?.instantiateViewController(withIdentifier: "jobDetail")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        
        else if searching {
            guard let jobsFilter = jobsFilter else {fatalError()}
            let job = jobsFilter[indexPath.row]
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
            
            let viewController = storyboard?.instantiateViewController(withIdentifier: "jobDetail")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        
    }
    
}

extension BrowseVacancyController: UISearchBarDelegate, UISearchControllerDelegate{
    
    
    func setUpSearchBar(){
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find a Job here"
        navigationItem.searchController = searchController
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searching = true
        
        jobs = Job.getJobs()
        
        guard !searchText.isEmpty else {
            jobsFilter = jobs
            tableViewJob.reloadData()
            return
        }
        
        jobsFilter = jobs?.filter({ (job) -> Bool in
            job.name.lowercased().contains(searchText.lowercased())
        })
        tableViewJob.reloadData()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        jobsFilter = jobs
        tableViewJob.reloadData()
    }
    
}
