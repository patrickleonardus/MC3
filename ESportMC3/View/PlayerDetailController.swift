//
//  PlayerDetailController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 20/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit
import CloudKit

class PlayerDetailController: UIViewController {

    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var usernameDetail: UILabel!
    @IBOutlet weak var locationDetail: UILabel!

    
    @IBOutlet weak var profileBGView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnHireNow: UIButton!
    
    let httpClient = HttpClientManager()
    let httpClient1 = HttpClientManager()
    var playerStatistic = PlayerStatistic(win: 0, lose: 0, avgWinRate: 0, kills: 0, deaths: 0, assists: 0, goldPerMin: 0, xpPerMin: 0, killsMax: 0, deathsMax: 0, assistsMax: 0, goldPerMinMax: 0, xpPerMinMax: 0)
    
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
    
//    func getPlayer(id : String) -> Player {
//        var player: Player
//        let recordId = CKRecord.ID(recordName: id)
//        CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordId) { record, error in
//            if error != nil {
//                return
//            }
//
//            let name = record!.value(forKey: "name") as! String
//            let alias = record!.value(forKey: "alias") as! String
//            let city = record!.value(forKey: "city") as! String
//            let gender = record!.value(forKey: "gender") as! String
//            let description = record!.value(forKey: "description") as! String
//
//            player = Player(image: "people1", name: name, username: alias, location: city, age: "19", gender: gender, jobAvailability: "Available", description: description, rank: "Immortal")
//        }
//
//        return player
//    }
    
    func loadPlayerData(){
//        let player = getPlayer(id: "7D3B4A15-3A69-8E28-8A81-801D48FA1513")
//        imageDetail.image = UIImage(named: UserDefaults.standard.object(forKey: "imageForDetail") as! String)
//        nameDetail.text = player.name
//        usernameDetail.text = player.username
//        locationDetail.text = "⌾ " + (player.location)
        
        imageDetail.image = UIImage(named: UserDefaults.standard.object(forKey: "imageForDetail") as! String)
        nameDetail.text = UserDefaults.standard.object(forKey: "nameForDetail") as? String
        usernameDetail.text = UserDefaults.standard.object(forKey: "userForDetail") as? String
        locationDetail.text = "⌾ " + (UserDefaults.standard.object(forKey: "locationForDetail") as! String)
        getPlayerStatistic(userName: UserDefaults.standard.object(forKey: "userNameForDetail") as! String)
    }
    
    func getPlayerStatistic(userName : String) {
        
        guard let urlWinLose = URL(string: "https://api.opendota.com/api/players/\(userName)/wl") else { return }
        httpClient.makeRequest(toURL: urlWinLose, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let winLose = try? decoder.decode(WinLose.self, from: data) else { return }
                let win = winLose.win ?? 0
                let lose = winLose.lose ?? 0
                self.playerStatistic.win = win
                self.playerStatistic.lose = lose
                self.playerStatistic.avgWinRate = win * 100 / (win + lose)
                print("avgWinRate : \(self.playerStatistic.avgWinRate)")
                print("win : \(self.playerStatistic.win ?? 0)")
                print("lose : \(self.playerStatistic.lose ?? 0)")
            }
        }
        
        guard let urlRecentMatch = URL(string: "https://api.opendota.com/api/players/\(userName)/recentMatches") else { return }
       
        httpClient1.makeRequest(toURL: urlRecentMatch, withHttpMethod: .get) { (results) in
        
            if let data = results.data {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let recentMatches = try? decoder.decode(RecentMatches.self, from: data) else { return }
                
                var i = 0
                var killsMax = 0
                var deathsMax = 0
                var assistsMax = 0
                var goldPerMinMax = 0
                var xpPerMinMax = 0
                print("Recent Matches seharusnya disini.....")
               print(recentMatches)
                for recentMatch in recentMatches {
                    i += 1
                    self.playerStatistic.kills += recentMatch.kills
                    self.playerStatistic.deaths += recentMatch.deaths
                    self.playerStatistic.assists += recentMatch.assists
                    self.playerStatistic.goldPerMin += recentMatch.goldPerMin
                    self.playerStatistic.xpPerMin += recentMatch.xpPerMin
                    
                    if recentMatch.kills > killsMax {
                        killsMax = recentMatch.kills
                    }
                    if recentMatch.deaths > deathsMax {
                        deathsMax = recentMatch.deaths
                    }
                    if recentMatch.assists > assistsMax {
                        assistsMax = recentMatch.assists
                    }
                    if recentMatch.goldPerMin > goldPerMinMax {
                        goldPerMinMax = recentMatch.goldPerMin
                    }
                    if recentMatch.xpPerMin > xpPerMinMax {
                        xpPerMinMax = recentMatch.xpPerMin
                    }
                   
                }
                
                self.playerStatistic.kills = self.playerStatistic.kills / i
                self.playerStatistic.deaths = self.playerStatistic.deaths / i
                self.playerStatistic.assists = self.playerStatistic.assists / i
                self.playerStatistic.goldPerMin = self.playerStatistic.goldPerMin / i
                self.playerStatistic.xpPerMin = self.playerStatistic.xpPerMin / i
                self.playerStatistic.killsMax = killsMax
                self.playerStatistic.deathsMax = deathsMax
                self.playerStatistic.assistsMax = assistsMax
                self.playerStatistic.goldPerMinMax = goldPerMinMax
                self.playerStatistic.xpPerMinMax = xpPerMinMax
                
                print("kills : \(self.playerStatistic.kills)")
                print("deaths : \(self.playerStatistic.deaths)")
                print("assists : \(self.playerStatistic.assists)")
                print("goldPerMin : \(self.playerStatistic.goldPerMin)")
                print("xpPerMin : \(self.playerStatistic.xpPerMin)")

                print("killsMax : \(self.playerStatistic.killsMax)")
                print("deathsMax : \(self.playerStatistic.deathsMax)")
                print("assistsMax : \(self.playerStatistic.assistsMax)")
                print("goldPerMinMax : \(self.playerStatistic.goldPerMinMax)")
                print("xpPerMinMax : \(self.playerStatistic.xpPerMinMax)")
            }
        }
    }
    
    func setUpUI(){
        
        btnHireNow.alpha = 0
        
        imageDetail.layer.cornerRadius = imageDetail.frame.height/2
        imageDetail.layer.borderWidth = 1
        imageDetail.layer.borderColor = UIColor.gray.cgColor
        
        profileBGView.layer.cornerRadius = 15
        profileBGView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        if UserDefaults.standard.string(forKey: "userRole") == "Team" {
            btnHireNow.alpha = 1
            btnHireNow.layer.shadowColor = UIColor.black.cgColor
            btnHireNow.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
            btnHireNow.layer.shadowRadius = 8
            btnHireNow.layer.shadowOpacity = 1
            btnHireNow.layer.masksToBounds = false
        }
        
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
            
            DispatchQueue.main.async {
                cell.lblWinRate.text = String(self.playerStatistic.avgWinRate)
                cell.lblWin.text = String(self.playerStatistic.win!)
                cell.lblLose.text = "\(self.playerStatistic.lose!)"
                cell.lblKill.text = "\(self.playerStatistic.kills)"
                cell.lblKillMax.text = "\(self.playerStatistic.killsMax) Maximum"
                cell.lblDeath.text = "\(self.playerStatistic.deaths)"
                cell.lblDeathMax.text = "\(self.playerStatistic.deathsMax) Maximum"
                cell.lblAssist.text = "\(self.playerStatistic.assists)"
                cell.lblAssistMax.text = "\(self.playerStatistic.assistsMax) Maximum"
                cell.lblGoldPerMin.text = "\(self.playerStatistic.goldPerMin)"
                cell.lblGoldPerMinMax.text = "\(self.playerStatistic.goldPerMinMax) Maximum"
                cell.lblXpPerMin.text = "\(self.playerStatistic.xpPerMin)"
                cell.lblXpPerMinMax.text = "\(self.playerStatistic.xpPerMinMax) Maximum"
                self.tableView.reloadData()
            }
            
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
