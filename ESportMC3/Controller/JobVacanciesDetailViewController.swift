//
//  JobVacanciesDetailViewController.swift
//  esportMC3
//
//  Created by Aditya Sanjaya on 26/08/19.
//  Copyright © 2019 Aditya. All rights reserved.
//

import UIKit

class JobVacanciesDetailViewController: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Details"
        navigationItem.largeTitleDisplayMode = .never
        
        //Wording Declaration
        let subject = UILabel()
        let status = UILabel()
        let date = UILabel()
        let descrip = UILabel()
        
        subject.text = (UserDefaults.standard.object(forKey: "subject") as! String)
        status.text = (UserDefaults.standard.object(forKey: "status") as! String)
        date.text = (UserDefaults.standard.object(forKey: "date") as! String)
        descrip.text = (String(describing: UserDefaults.standard.object(forKey: "descrip")!))
        status.font = status.font.withSize(14)
        descrip.numberOfLines = 5
        
        
        if status.text == "Waiting for confirmation"{
            status.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        }
        else if status.text == "Rejected"{
            status.textColor = #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)
        }
        else if status.text == "Accepted"{
            status.textColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
        }
        
        self.view.addSubview(subject)
        self.view.addSubview(status)
        self.view.addSubview(date)
        self.view.addSubview(descrip)
        
        //Separator Declaration
        let separatorLine = UIView()
        separatorLine.layer.borderWidth = 10.0
        separatorLine.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        self.view.addSubview(separatorLine)
        
        //Wording Constraint
        subject.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        status.anchor(top: subject.bottomAnchor, leading: subject.leadingAnchor, bottom: nil, trailing: subject.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        date.anchor(top: subject.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        descrip.anchor(top: separatorLine.bottomAnchor, leading: status.leadingAnchor, bottom: nil, trailing: status.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        //Separator Constraint
        separatorLine.anchor(top: status.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 10, bottom: 10, right: 10), size: .init(width: 500, height: 1))
        
        
        let tolak = UIButton()
        tolak.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tolak.layer.borderColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        tolak.layer.borderWidth = 2
        tolak.layer.cornerRadius = 10
        tolak.setTitle("Refuse", for: .normal)
        tolak.setTitleColor(#colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1), for: .normal)
        tolak.addTarget(self, action: #selector(tolakAction), for: .touchUpInside)
        
        self.view.addSubview(tolak)
        
        
        
        //Tolak Button Constraint
        tolak.anchor(top: descrip.bottomAnchor, leading: descrip.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 180, height: 40))
        
        //Terima Button
        let terima = UIButton()
        terima.backgroundColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        terima.layer.borderColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        terima.layer.borderWidth = 2
        terima.layer.cornerRadius = 10
        terima.setTitle("Accept Invitation", for: .normal)
        terima.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
        terima.addTarget(self, action: #selector(terimaAction), for: .touchUpInside)
        
        self.view.addSubview(terima)
        
        
        let phoneCall = UIButton()
        phoneCall.backgroundColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        phoneCall.layer.borderColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        phoneCall.layer.borderWidth = 2
        phoneCall.layer.cornerRadius = 10
        phoneCall.setTitle("Phone Call", for: .normal)
        phoneCall.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
        phoneCall.addTarget(self, action: #selector(phoneCallAction), for: .touchUpInside)
        
        self.view.addSubview(phoneCall)
        
        
        let invite = UIButton()
        invite.backgroundColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        invite.layer.borderColor = #colorLiteral(red: 0.5868142843, green: 0.01357545238, blue: 0.1108099297, alpha: 1)
        invite.layer.borderWidth = 2
        invite.layer.cornerRadius = 10
        invite.setTitle("Invite to interview/trial", for: .normal)
        invite.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
        invite.addTarget(self, action: #selector(phoneCallAction), for: .touchUpInside)
        
        self.view.addSubview(invite)
        
        
        //Terima Button Constraint
        terima.anchor(top: tolak.topAnchor, leading: tolak.trailingAnchor, bottom: nil, trailing: descrip.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        terima.heightAnchor.constraint(equalTo: tolak.heightAnchor).isActive = true
        terima.widthAnchor.constraint(equalTo: tolak.widthAnchor).isActive = true

        
        print(UserDefaults.standard.integer(forKey: "screen"))
        if UserDefaults.standard.integer(forKey: "screen") == 1 {
            tolak.removeFromSuperview()
            terima.removeFromSuperview()
            phoneCall.removeFromSuperview()
            invite.removeFromSuperview()
        }
        
        else if UserDefaults.standard.integer(forKey: "screen") == 2 {
            self.view.addSubview(terima)
            self.view.addSubview(tolak)
            phoneCall.removeFromSuperview()
            invite.removeFromSuperview()
        }
        
        else if UserDefaults.standard.integer(forKey: "screen") == 3 {
            self.view.addSubview(phoneCall)
            tolak.removeFromSuperview()
            terima.removeFromSuperview()
            phoneCall.anchor(top: descrip.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: .init(width: 180, height: 40))
            print("3")
            
        }
        else if UserDefaults.standard.integer(forKey: "screen") == 4 {
            self.view.addSubview(tolak)
            self.view.addSubview(phoneCall)
            self.view.addSubview(invite)
            terima.removeFromSuperview()
            phoneCall.anchor(top: tolak.topAnchor, leading: tolak.trailingAnchor, bottom: nil, trailing: descrip.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
            phoneCall.heightAnchor.constraint(equalTo: tolak.heightAnchor).isActive = true
            phoneCall.widthAnchor.constraint(equalTo: tolak.widthAnchor).isActive = true
            invite.anchor(top: tolak.bottomAnchor, leading: tolak.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
            invite.heightAnchor.constraint(equalTo: tolak.heightAnchor).isActive = true
            invite.widthAnchor.constraint(equalToConstant: 373).isActive = true
            print("4")
        }
    

    }
    
    @objc func tolakAction(sender: UIButton!){
        print("TOLAK!")
    }
    
    @objc func terimaAction(sender: UIButton!){
        print("TERIMA!")
    }
    
    @objc func phoneCallAction(sender: UIButton!){
        
    }
}
