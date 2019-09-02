//
//  JobVacanciesViewController.swift
//  esportMC3
//
//  Created by Aditya Sanjaya on 21/08/19.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class JobVacanciesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    lazy var rowsToDisplay = DataManager.shared.playerNameList
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCellJob
        cell.subject = rowsToDisplay[indexPath.row]
        cell.descrip = "Menawarkan pekerjaan untuk role \(DataManager.shared.roleList[indexPath.row]) di tim..."
        cell.date = DataManager.shared.dateList[indexPath.row]
        cell.status = DataManager.shared.statusList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
        if cell.status == "Menunggu konfirmasi"{
            cell.statusView.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        }
        else if cell.status == "Ditolak"{
            cell.statusView.textColor = #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)
        }
        else{
            cell.statusView.textColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
        }
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let subjectTemp = rowsToDisplay[indexPath.row]
        let statusTemp = DataManager.shared.statusList[indexPath.row]
        let dateTemp = DataManager.shared.dateList[indexPath.row]
        let descripTemp = "Menawarkan pekerjaan untuk role \(DataManager.shared.roleList[indexPath.row]) di tim Dota 2 kami. Jika anda tertarik, silahkan menerima tawaran kami. Setelah itu kami akan menghubungi anda lebih lanjut untuk proses selanjutnya. Terima kasih."
        
        UserDefaults.standard.set(subjectTemp, forKey: "subject")
        UserDefaults.standard.set(statusTemp, forKey: "status")
        UserDefaults.standard.set(dateTemp, forKey: "date")
        UserDefaults.standard.set(descripTemp, forKey: "descrip")
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "vacancyDetail")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        
    }
    
    let segmentedControl : UISegmentedControl = {
        if DataManager.shared.player == true{
            var segmentItems = ["Application","Offer"]
            let sc = UISegmentedControl(items: segmentItems)
            sc.selectedSegmentIndex = 0
            sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            return sc
        }
        else{
            var segmentItems = ["Offer","Application"]
            let sc = UISegmentedControl(items: segmentItems)
            sc.selectedSegmentIndex = 0
            sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            return sc
        }
    }()
    
    @objc fileprivate func handleSegmentChange(){
        print(segmentedControl.selectedSegmentIndex)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = DataManager.shared.playerNameList
        case 1:
            rowsToDisplay = DataManager.shared.clubNameList
        default:
            print("Impossible")
        }
        
        tableView.reloadData()
    }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CustomCellJob.self, forCellReuseIdentifier: "custom")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        navigationItem.title = "Vacancy"
        
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
        
    }
    
}

