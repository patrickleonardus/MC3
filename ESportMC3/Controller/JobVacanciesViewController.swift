//
//  JobVacanciesViewController.swift
//  esportMC3
//
//  Created by Aditya Sanjaya on 21/08/19.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class JobVacanciesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let validation = UserDefaults.standard.bool(forKey: "userCheck")
    
    @IBOutlet weak var viewValidation: UIView!
    
    lazy var rowsToDisplay = DataManager.shared.clubNameList
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCellJob
        
        if UserDefaults.standard.string(forKey: "userRole") == "Player"{
            rowsToDisplay = DataManager.shared.clubNameList
        }
            
        else if UserDefaults.standard.string(forKey: "userRole") == "Team"{
            rowsToDisplay = DataManager.shared.playerNameList
        }
        
        cell.subject = rowsToDisplay[indexPath.row]
        
        if UserDefaults.standard.string(forKey: "userRole") == "Player"{
            if segmentedControl.selectedSegmentIndex == 0 {
                cell.descrip = "You applied for the Dota2 team as a \(DataManager.shared.roleList[indexPath.row])"
            }
            else{
                cell.descrip = "Offering job in \(DataManager.shared.roleList[indexPath.row]) role for team Dota 2..."
            }
        }
        else if UserDefaults.standard.string(forKey: "userRole") == "Team"{
            if segmentedControl.selectedSegmentIndex == 0 {
                cell.descrip = "You offer jobs for \(DataManager.shared.roleList[indexPath.row]) role positions"
            }
            else{
                cell.descrip = "Applying for a job for \(DataManager.shared.roleList[indexPath.row]) role in Dota2..."
            }
        }
        
        
        cell.date = DataManager.shared.dateList[indexPath.row]
        cell.status = DataManager.shared.statusList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        if cell.status == "Waiting for confirmation"{
            cell.statusView.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        }
        else if cell.status == "Refused"{
            cell.statusView.textColor = #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)
        }
        else if cell.status == "Accepted"{
            cell.statusView.textColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
        }
        else if cell.status == "Interview Appointment"{
            cell.statusView.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        }
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let subjectTemp = rowsToDisplay[indexPath.row]
        let statusTemp = DataManager.shared.statusList[indexPath.row]
        let dateTemp = DataManager.shared.dateList[indexPath.row]
        
        
        if UserDefaults.standard.string(forKey: "userRole") == "Player"{
            if segmentedControl.selectedSegmentIndex == 0 {
                let descripTemp = "You apply for \(DataManager.shared.roleList[indexPath.row]) role in Dota 2 team \(rowsToDisplay[indexPath.row])"
                UserDefaults.standard.set(descripTemp, forKey: "descrip")
                UserDefaults.standard.set(1, forKey: "screen")
            }
            if segmentedControl.selectedSegmentIndex == 1 {
                let descripTemp = "We are glad to offer you a job for \(DataManager.shared.roleList[indexPath.row]) role in our Dota 2 Division. We would like to invite you for interview job if you willing to accept the interview, we will set the schedule and appointment for further. Thank you."
                UserDefaults.standard.set(descripTemp, forKey: "descrip")
                UserDefaults.standard.set(2, forKey: "screen")
            }
        }
        else if UserDefaults.standard.string(forKey: "userRole") == "Team"{
            if segmentedControl.selectedSegmentIndex == 0{
                let descripTemp = "You offer jobs for \(DataManager.shared.roleList[indexPath.row]) positions in your Dota 2 team. Player is thinking about your offer. Please wait for the answer."
                UserDefaults.standard.set(descripTemp, forKey: "descrip")
                UserDefaults.standard.set(3, forKey: "screen")
            }
            if segmentedControl.selectedSegmentIndex == 1{
                let descripTemp = "Apply for a job for role \(DataManager.shared.roleList[indexPath.row]) on your Dota 2 team. You can accept or reject these applications according to your team's expectations."
                UserDefaults.standard.set(descripTemp, forKey: "descrip")
                UserDefaults.standard.set(4, forKey: "screen")
            }
        }
        
        UserDefaults.standard.set(subjectTemp, forKey: "subject")
        UserDefaults.standard.set(statusTemp, forKey: "status")
        UserDefaults.standard.set(dateTemp, forKey: "date")
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "vacancyDetail")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        
    }
    
    let segmentedControl : UISegmentedControl = {
        var role = UserDefaults.standard.string(forKey: "userRole")
        if role == "Player"{
            var segmentItems = ["Application","Offer"]
            let sc = UISegmentedControl(items: segmentItems)
            sc.selectedSegmentIndex = 0
            sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            return sc
        }
        else if role == "Team"{
            var segmentItems = ["Offer","Application"]
            let sc = UISegmentedControl(items: segmentItems)
            sc.selectedSegmentIndex = 0
            sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            return sc
        }
        return UISegmentedControl()
    }()
    
    @objc fileprivate func handleSegmentChange(){
        print(segmentedControl.selectedSegmentIndex)
        
//        switch segmentedControl.selectedSegmentIndex {
//        case 0:
//            rowsToDisplay = DataManager.shared.clubNameList
//        case 1:
//            rowsToDisplay = DataManager.shared.playerNameList
//        default:
//            print("Impossible")
//        }
        
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    func userCheck(){
        if validation {
            viewValidation.alpha = 0
        }
        
        else if validation == false {
            viewValidation.alpha = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userCheck()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.tintColor = Colors().mainRed
        
        tableView.tableFooterView = UIView()
        
        self.tableView.register(CustomCellJob.self, forCellReuseIdentifier: "custom")
        
        tableView.dataSource = self
        tableView.delegate = self
                
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [
            segmentedControl, tableView
            ])
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        
        segmentedControl.anchor(top: stackView.topAnchor, leading: stackView.leadingAnchor, bottom: tableView.topAnchor, trailing: stackView.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        tableView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .zero)

        view.bringSubviewToFront(viewValidation)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        performSegue(withIdentifier: "goToLoginFromVacancy", sender: self)
    }
    
    
}

