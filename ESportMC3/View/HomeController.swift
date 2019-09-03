//
//  HomeController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 21/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit
import CloudKit

class HomeController: UIViewController {
    
//    var playersName = ["Angel Clara","Nixia","Sarah Viloid"]
//    var playersLocation = ["Jakarta","Bandung","Jakarta"]
//    var playersImage = ["Players1","Players2","Players3"]
//
//    var teamName = ["NXL Team","Evos Team", "RRQ","Eight8-Team"]
//    var teamLocation = ["Jakarta","Tangerang","Serpong","Jakarta"]
//    var teamImage = ["Team1","Team2","Team3","Team4"]
//
//
//    var jobName = ["Dota 2 Championship 2017","Dota 2 Tournament 2018", "Dota 2 Championship League"]
//    var jobSalary = ["Rp.3.000.000 - Rp.5.000.000", "Rp.3.000.000 - Rp.5.000.000", "Rp.3.000.000 - Rp.5.000.000"]
//    var jobRole = ["Support","Leader","Finisher"]
//    var jobGender = ["Male","Male","Female"]
    
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var tableViewSearch: UITableView!
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var viewValidationDisplay: UIView!
    
    var textField = UITextField()
    
    var players: [Player] = []
    var teams : [Team] = []
    var jobs : [Job]?
    
    var playersFilter : [Player]?
    var teamsFilter : [Team]?
  
    var discoverPlayer: DiscoverPlayer?
    var discoverTeam : DiscoverTeam?
    var discoverJob : DiscoverJob?
    
    var player : Player?
    var team: Team?
    var job: Job?
    
    var searching = false
    var checkResult1 = false
    var checkResult2 = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        setUpUI()
        setUpSearchBar()
        checkUser()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HomeController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if viewSearch.alpha == 1 {
            tabBarController?.tabBar.isHidden = true
        }
        
//        loadPlayers()
//        getClubs()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewSearch.alpha == 1 {
            DispatchQueue.main.async {
                self.searchController.searchBar.becomeFirstResponder()
            }
        }
    }
    func setUpUI(){
        viewSearch.alpha = 0
        viewValidationDisplay.alpha = 0
        tableViewHome.allowsSelection = false
        
    }
    
    func loadPlayers() {
        print(#function)
        getPlayers()
//        DispatchQueue.main.async {
//            self.getPlayers()
//        }
    }
    
    func getClubs() {
        print(#function)
        self.teams = []
        let query = CKQuery(recordType: "Clubs", predicate: NSPredicate(value: true))
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else {
                print("error getClub \(String(describing: error))")
                return
                
            }
            
//            DispatchQueue.main.async {
                for record in records {
                    let name = record.value(forKey: "name") as! String
                    let alias = record.value(forKey: "alias") as! String
                    let city = record.value(forKey: "city") as! String
                    let description = record.value(forKey: "description") as! String
                    let image = record.value(forKey: "image") as! String
                    
                    let team = Team(image: image, name: name, location: city, description: description, alias: alias)
                    
                    print("club : \(name)")
                    
                    self.teams.append(team)
                }
//            }
            
            //reload harus di dalam closure
            DispatchQueue.main.async {
                self.tableViewHome.reloadData()
                self.tableViewSearch.reloadData()
            }
        }
    }
    
    func getPlayers() {
        print(#function)
        self.players = []
        print("Player \(Date().timeIntervalSince1970)")
        let query = CKQuery(recordType: "Players", predicate: NSPredicate(value: true))
//        var qop = CKQueryOperation (query: query)
//
//        qop.resultsLimit = 5
//        qop.queryCompletionBlock = { (c:CKQueryOperation.Cursor!, e:NSError!) -> Void in
//            if nil != c {
//                // there is more to do; create another op
//                var newQop = CKQueryOperation (cursor: c!)
//                newQop.resultsLimit = qop.resultsLimit
//                newQop.queryCompletionBlock = qop.queryCompletionBlock
//
//                // Hang on to it, if we must
//                qop = newQop
//
//                // submit
//                ....addOperation(qop)
//            }
//            } as? (CKQueryOperation.Cursor?, Error?) -> Void
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            guard let records = records else { return }
            print("Player DONE \(Date().timeIntervalSince1970)")
//            DispatchQueue.main.async {
                for record in records {
                    let name = record.value(forKey: "name") as! String
                    let alias = record.value(forKey: "alias") as! String
                    let city = record.value(forKey: "city") as! String
                    let gender = record.value(forKey: "gender") as! String
                    let description = record.value(forKey: "description") as! String
                    let image = record.value(forKey: "image") as! String
                    
                    let player = Player(image: image, name: name, username: alias, location: city, age: "23", gender: gender, jobAvailability: "Available", description: description, rank: "Immortal")
                    
                    self.players.append(player)
                }
//            }
            
            //reload harus di dalam closure
            DispatchQueue.main.async {
                self.tableViewHome.reloadData()
                self.tableViewSearch.reloadData()
            }
        }
    }

    @objc func btnBrowse(sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "vacancySearch")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height - 80
            tableViewSearch.setBottomInset(to: keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        tableViewSearch.setBottomInset(to: 0.0)
    }
    
    func checkUser(){
        
        if UserDefaults.standard.bool(forKey: "userCheck") == false {
            tabBarController?.viewControllers?.remove(at: 2)
        }
        
        else if UserDefaults.standard.bool(forKey: "userCheck") == true {
            if UserDefaults.standard.string(forKey: "userRole") == "Player" {
                tabBarController?.viewControllers?.remove(at: 2)
            }
            else if UserDefaults.standard.string(forKey: "userRole") == "Team" {
                tabBarController?.viewControllers?.remove(at: 3)
            }
        }
        
        
    }
    
}

extension UITableView {
    
    func setBottomInset(to value: CGFloat) {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
        
        self.contentInset = edgeInset
        self.scrollIndicatorInsets = edgeInset
    }
    
}

extension HomeController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //        players = Player.getPlayers()
        //        players = getPlayers()
        //        teams = Team.getTeams()
        
        var numberOfRow = 0
        
        switch tableView {
            
        case tableViewHome:
            
            if section == 0 {
                if players.count == 5 {
                    numberOfRow = players.count - 4
                } else if players.count == 4 {
                    numberOfRow = players.count - 3
                } else if players.count == 3 {
                    numberOfRow = players.count - 2
                } else if players.count == 2 {
                    numberOfRow = players.count - 1
                } else {
                    numberOfRow = players.count
                }
                //                    numberOfRow = 1
            }
                
            else if section == 1 {
                if teams.count == 5 {
                    numberOfRow = teams.count - 4
                } else if teams.count == 4 {
                    numberOfRow = teams.count - 3
                } else if teams.count == 3 {
                    numberOfRow = teams.count - 2
                } else if teams.count == 2 {
                    numberOfRow = teams.count - 1
                } else {
                    numberOfRow = teams.count
                }
                //                    numberOfRow = 1
            }
                
            else if section == 2 {
                numberOfRow = 1
            }
            
        case tableViewSearch:
            if section == 0{
                if searching == false {
                    numberOfRow = players.count
                }
                else if searching == true {
                    numberOfRow = playersFilter!.count
                    
                    if numberOfRow == 0{
                        checkResult1 = true
                    }
                    else if numberOfRow > 0 {
                        checkResult1 = false
                    }
                }
            }
            else if section == 1{
                if searching == false {
                    numberOfRow = teams.count
                }
                else if searching == true {
                    numberOfRow = teamsFilter!.count
                    if numberOfRow == 0{
                        checkResult2 = true
                    }
                    else if numberOfRow > 0 {
                        checkResult2 = false
                    }
                }
            }
            
        default:
            print("Something went wrong1")
        }
        
        return numberOfRow
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        var numberOfSection = 0
        
        switch tableView {
        case tableViewHome:
            numberOfSection = 3
        case tableViewSearch:
            numberOfSection = 2
        default:
            print("Something went wrong2")
        }
        
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch tableView {
        case tableViewHome:
            if section == 0 {
                return "Discover Player"
            } else if section == 1 {
                return "Discover Team"
            } else if section == 2 {
                return "Discover Job"
            }
        case tableViewSearch:
            if section == 0 {
               return "Player"
            }
            else if section == 1 {
                return "Team"
            }
            
        default:
            print("Something went wrong3")
        }
        
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = CGFloat(0)
        
        switch tableView {
        case tableViewHome :
            if indexPath.section == 0 {
                height = 200
            }
            else if indexPath.section == 1 {
                height = 185
            }
            else if indexPath.section == 2{
                height = 210
            }
            
        case tableViewSearch:
            height = 120
        default:
            print("Something went wrong4")
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case tableViewHome:
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as! HomePlayerTableViewCell
//                cell.players = Player.getPlayers()
                cell.players = self.players
                cell.playerDidTapListener = self
                //            discoverPlayer = DiscoverPlayer(name: playersImage, location: playersLocation, image: playersImage)
                return cell
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! HomeTeamTableViewCell
//                cell.teams = Team.getTeams()
                cell.teams = self.teams
                cell.teamDidTapListener = self
                //            discoverTeam = DiscoverTeam(image: teamImage, name: teamName, location: teamLocation)
                return cell
            } else if indexPath.section == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell") as! HomeJobTableViewCell
                cell.jobs = Job.getJobs()
                cell.jobDidTapListener = self
                //            discoverJob = DiscoverJob(name: jobName, salary: jobSalary, role: jobRole, gender: jobGender)
                return cell
            }
        case tableViewSearch :
            if indexPath.section == 0 {
                if searching == false {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "searchPlayerCell") as! SearchPlayerHomeTableViewCell
//                    playersFilter = Player.getPlayers()
                    playersFilter = self.players
                    let player = players[indexPath.row]
                    cell.imageSearch.image = UIImage(named: player.image)
                    
                    cell.imageSearch.layer.cornerRadius = cell.imageSearch.frame.height/2
                    cell.imageSearch.layer.borderWidth = 1
                    cell.imageSearch.layer.borderColor = UIColor.black.cgColor
                    
                    cell.nameSearch.text = player.name
                    cell.usernameSearch.text = player.username
                    cell.locationSearch.text = "⌾ " + player.location
                    return cell
                }
                else if searching == true {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "searchPlayerCell") as! SearchPlayerHomeTableViewCell
                    guard let playersFilter = playersFilter else {fatalError()}
                   
                    let player = playersFilter[indexPath.row]
                    
                    cell.imageSearch.image = UIImage(named: player.image)
                    
                    cell.imageSearch.layer.cornerRadius = cell.imageSearch.frame.height/2
                    cell.imageSearch.layer.borderWidth = 1
                    cell.imageSearch.layer.borderColor = UIColor.black.cgColor
                    
                    cell.nameSearch.text = player.name
                    cell.usernameSearch.text = player.username
                    cell.locationSearch.text = "⌾ " + player.location
                    
                    return cell
                    
                 
                }
                
            }
            else if indexPath.section == 1 {
                
                if searching == false {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "searchTeamCell") as! SearchTeamTableViewCell
//                    teams = Team.getTeams()
                    teamsFilter = self.teams
//                    guard let teams = teams else {fatalError()}
                    let team = teams[indexPath.row]
                    cell.imageSearch.image = UIImage(named: team.image)
                    
                    cell.imageSearch.layer.cornerRadius = cell.imageSearch.frame.height/2
                    cell.imageSearch.layer.borderWidth = 1
                    cell.imageSearch.layer.borderColor = UIColor.black.cgColor
                    
                    cell.nameSearch.text = team.name
                    cell.locationSearch.text = "⌾ " + team.location
                    return cell
                }
                else if searching == true {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "searchTeamCell") as! SearchTeamTableViewCell
                    guard let teamsFilter = teamsFilter else {fatalError()}
                    let team = teamsFilter[indexPath.row]
                    cell.imageSearch.image = UIImage(named: team.image)
                    
                    cell.imageSearch.layer.cornerRadius = cell.imageSearch.frame.height/2
                    cell.imageSearch.layer.borderWidth = 1
                    cell.imageSearch.layer.borderColor = UIColor.black.cgColor
                    
                    cell.nameSearch.text = team.name
                    cell.locationSearch.text = "⌾ " + team.location
                    return cell
                }
               
            }
        default:
            print("Something went wrong5")
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        switch tableView {
        case tableViewSearch:
            if section == 0 {

                if searching {
                    if checkResult1 {
                        return 0.0
                    }
                    else if !checkResult1 {
                        return UITableView.automaticDimension
                    }
                }
            }

            else if section == 1 {

                if searching {
                    if checkResult2 {
                        
                        return 0.0
                    }
                    else if !checkResult2 {
                        return UITableView.automaticDimension
                    }
                }
            }
        default:
            return UITableView.automaticDimension
        }

        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch tableView {
            
        case tableViewHome:
            
            if section == 0 {
                let frame: CGRect = tableView.frame
                
                let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
                label.text = "Discover Players"
                label.font = UIFont.boldSystemFont(ofSize: 17)
                
                let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
                headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                headerView.addSubview(label)
                return headerView
            }
            else if section == 1 {
                let frame: CGRect = tableView.frame
                
                let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
                label.text = "Discover Teams"
                label.font = UIFont.boldSystemFont(ofSize: 17)

                let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
                headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                headerView.addSubview(label)
                return headerView
            }
            else if section == 2 {
                
                let frame: CGRect = tableView.frame
                
                let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
                label.text = "Discover Jobs"
                label.font = UIFont.boldSystemFont(ofSize: 17)
                
                let btnBrowse: UIButton = UIButton(frame: CGRect(x: frame.size.width - 110, y: 0, width: 100, height: 28))
                btnBrowse.setTitle("Browse All ›", for: [])
                btnBrowse.setTitleColor(UIColor(red: 20/255, green: 126/255, blue: 251/255, alpha: 1), for: [])
                btnBrowse.titleLabel!.font = UIFont.systemFont(ofSize: 15.0)
                btnBrowse.addTarget(self, action: #selector(btnBrowse(sender:)), for: .touchUpInside)
                
                let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
                headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                headerView.addSubview(btnBrowse)
                headerView.addSubview(label)
                return headerView
            }
            
        case tableViewSearch :
            
            if section == 0 {
                let frame: CGRect = tableView.frame
                
                let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
                label.text = "Players"
                label.font = UIFont.boldSystemFont(ofSize: 17)
                
                let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
                headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                headerView.addSubview(label)
                return headerView
            }
            else if section == 1 {
                let frame: CGRect = tableView.frame
                
                let label : UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 150, height: 28))
                label.text = "Teams"
                label.font = UIFont.boldSystemFont(ofSize: 17)
                
                let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
                headerView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                headerView.addSubview(label)
                return headerView
            }
            
        default:
            print("Something went wrong7")
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case tableViewSearch:
            
            if searching == false {
                if indexPath.section == 0 {
                    
                    let player = players[indexPath.row]
                    
                    let imageTemp = player.image
                    let nameTemp = player.name
                    let userTemp = player.username
                    let ageTemp = player.age
                    let genderTemp = player.gender
                    let locationTemp = player.location
                    let descriptionTemp = player.description
                    let rankTemp = player.rank
                    
                    UserDefaults.standard.set(imageTemp, forKey: "imageForDetail")
                    UserDefaults.standard.set(nameTemp, forKey: "nameForDetail")
                    UserDefaults.standard.set(userTemp, forKey: "userForDetail")
                    UserDefaults.standard.set(ageTemp, forKey: "ageForDetail")
                    UserDefaults.standard.set(genderTemp, forKey: "genderForDetail")
                    UserDefaults.standard.set(locationTemp, forKey: "locationForDetail")
                    UserDefaults.standard.set(descriptionTemp, forKey: "descriptionForDetail")
                    UserDefaults.standard.set(rankTemp, forKey: "rankForDetail")
                    
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "playerDetail")
                    self.navigationController?.pushViewController(viewController!, animated: true)
                    
                    tableView.deselectRow(at: indexPath, animated: true)
                    
                }
                else if indexPath.section == 1 {
                    
//                    guard let teams = teams else {fatalError()}
                    let team = teams[indexPath.row]
                    
                    let imageTemp = team.image
                    let nameTemp = team.name
                    let locationTemp = team.location
                    let descTemp = team.description
                    let aliasTemp = team.alias
                    
                    UserDefaults.standard.set(imageTemp, forKey: "imageForDetail")
                    UserDefaults.standard.set(nameTemp, forKey: "nameForDetail")
                    UserDefaults.standard.set(locationTemp, forKey: "locationForDetail")
                    UserDefaults.standard.set(descTemp, forKey: "descriptionForDetail")
                    UserDefaults.standard.set(aliasTemp, forKey: "aliasForDetail")
                    
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "teamDetail")
                    self.navigationController?.pushViewController(viewController!, animated: true)
                    
                    tableView.deselectRow(at: indexPath, animated: true)
                    
                }
            }
            
            else if searching == true {
                if indexPath.section == 0 {
                    
                    guard let playersFilter = playersFilter else {fatalError()}
                    let player = playersFilter[indexPath.row]
                    
                    let imageTemp = player.image
                    let nameTemp = player.name
                    let userTemp = player.username
                    let ageTemp = player.age
                    let genderTemp = player.gender
                    let locationTemp = player.location
                    let descriptionTemp = player.description
                    let rankTemp = player.rank
                    
                    UserDefaults.standard.set(imageTemp, forKey: "imageForDetail")
                    UserDefaults.standard.set(nameTemp, forKey: "nameForDetail")
                    UserDefaults.standard.set(userTemp, forKey: "userForDetail")
                    UserDefaults.standard.set(ageTemp, forKey: "ageForDetail")
                    UserDefaults.standard.set(genderTemp, forKey: "genderForDetail")
                    UserDefaults.standard.set(locationTemp, forKey: "locationForDetail")
                    UserDefaults.standard.set(descriptionTemp, forKey: "descriptionForDetail")
                    UserDefaults.standard.set(rankTemp, forKey: "rankForDetail")
                    
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "playerDetail")
                    self.navigationController?.pushViewController(viewController!, animated: true)
                    
                    tableView.deselectRow(at: indexPath, animated: true)
                    
                }
                
                else if indexPath.section == 1 {
                    
//                    guard let teams = teams else {fatalError()}
//                    let team = teams[indexPath.row]
                    
                    guard let teamsFilter = teamsFilter else {fatalError()}
                    let team = teamsFilter[indexPath.row]

                    
                    let imageTemp = team.image
                    let nameTemp = team.name
                    let locationTemp = team.location
                    let descTemp = team.description
                    let aliasTemp = team.alias
                    
                    UserDefaults.standard.set(imageTemp, forKey: "imageForDetail")
                    UserDefaults.standard.set(nameTemp, forKey: "nameForDetail")
                    UserDefaults.standard.set(locationTemp, forKey: "locationForDetail")
                    UserDefaults.standard.set(descTemp, forKey: "descriptionForDetail")
                    UserDefaults.standard.set(aliasTemp, forKey: "aliasForDetail")
                    
                    let viewController = storyboard?.instantiateViewController(withIdentifier: "teamDetail")
                    self.navigationController?.pushViewController(viewController!, animated: true)
                    
                    tableView.deselectRow(at: indexPath, animated: true)
                }
            }
            
        default:
           return  print("Something went wrong8")
        }
    }
    
  
    
}

extension HomeController: PlayerListener {
    func didTap(player: Player) {
        
        let imageTemp = player.image
        let nameTemp = player.name
        let userTemp = player.username
        let ageTemp = player.age
        let genderTemp = player.gender
        let locationTemp = player.location
        let descriptionTemp = player.description
        let rankTemp = player.rank
        let userName = player.username
        
        UserDefaults.standard.set(imageTemp, forKey: "imageForDetail")
        UserDefaults.standard.set(nameTemp, forKey: "nameForDetail")
        UserDefaults.standard.set(userTemp, forKey: "userForDetail")
        UserDefaults.standard.set(ageTemp, forKey: "ageForDetail")
        UserDefaults.standard.set(genderTemp, forKey: "genderForDetail")
        UserDefaults.standard.set(locationTemp, forKey: "locationForDetail")
        UserDefaults.standard.set(descriptionTemp, forKey: "descriptionForDetail")
        UserDefaults.standard.set(rankTemp, forKey: "rankForDetail")
        UserDefaults.standard.set(userName, forKey: "userNameForDetail")
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "playerDetail")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        
        //do something here
    }
}

extension HomeController: TeamListener {
    func didTap(team: Team) {
        
        let imageTemp = team.image
        let nameTemp = team.name
        let locationTemp = team.location
        let descTemp = team.description
        let aliasTemp = team.alias
        
        UserDefaults.standard.set(imageTemp, forKey: "imageForDetail")
        UserDefaults.standard.set(nameTemp, forKey: "nameForDetail")
        UserDefaults.standard.set(locationTemp, forKey: "locationForDetail")
        UserDefaults.standard.set(descTemp, forKey: "descriptionForDetail")
        UserDefaults.standard.set(aliasTemp, forKey: "aliasForDetail")
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "teamDetail")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        //do something here
    }
}

extension HomeController : JobListener {
    func didTap(job: Job) {
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "jobDetail")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        //do something here
    }
    
}

extension HomeController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func setUpSearchBar(){
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find Player and Team here"
        navigationItem.searchController = searchController
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchController.searchBar.showsCancelButton = true
        
        searching = true
        
//        players = Player.getPlayers()
        //players = getPlayers()
//        teams = Team.getTeams()
        
        guard !searchText.isEmpty else {
            playersFilter = players
            teamsFilter = teams
            tableViewSearch.reloadData()
            viewValidationDisplay.alpha = 0
            return
        }
            
        playersFilter = players.filter({ (player) -> Bool in
            player.name.lowercased().contains(searchText.lowercased())
        })
        teamsFilter = teams.filter({ (team) -> Bool in
            team.name.lowercased().contains(searchText.lowercased())
        })
        tableViewSearch.reloadData()
        
        if checkResult1 && checkResult2 {
            viewValidationDisplay.alpha = 1
        }
        else if checkResult1 == false || checkResult2 == false {
            viewValidationDisplay.alpha = 0
        }
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewSearch.alpha = 1
        viewValidationDisplay.alpha = 0
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewSearch.endEditing(true)
        tabBarController?.tabBar.isHidden = true

        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        viewSearch.alpha = 0
        viewValidationDisplay.alpha = 0
        
        playersFilter = players
        teamsFilter = teams
        tableViewSearch.reloadData()
        
        tabBarController?.tabBar.isHidden = false
    
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
    }
}

class snappingLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        var offsetAdjusment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + (collectionView.bounds.width / 2)
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
        layoutAttributesArray?.forEach({ (layoutAttributes) in
            let itemHorizontalCenter = layoutAttributes.center.x
            
            if abs(itemHorizontalCenter - horizontalCenter) < abs(offsetAdjusment) {
                if abs(velocity.x) < 10 {
                    offsetAdjusment = itemHorizontalCenter - horizontalCenter
                } else if velocity.x > 0 {
                    offsetAdjusment = itemHorizontalCenter - horizontalCenter + layoutAttributes.bounds.width
                } else {
                    offsetAdjusment = itemHorizontalCenter - horizontalCenter - layoutAttributes.bounds.width
                }
            }
        })
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjusment, y: proposedContentOffset.y)
    }
}

