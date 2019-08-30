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
        descrip.text = "Menawarkan pekerjaan untuk role \(String(describing: UserDefaults.standard.object(forKey: "descrip"))) di tim Dota 2 kami. Jika anda tertarik, silahkan menerima tawaran kami. Setelah itu kami akan menghubungi anda lebih lanjut untuk proses selanjutnya. Terima kasih."
        status.font = status.font.withSize(14)
        descrip.numberOfLines = 5
        
        
        if status.text == "Menunggu konfirmasi"{
            status.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
        }
        else if status.text == "Ditolak"{
            status.textColor = #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)
        }
        else{
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
        
        //Tolak Button Declaration
        let tolak = UIButton()
        tolak.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tolak.layer.borderColor = #colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1)
        tolak.layer.borderWidth = 2
        tolak.layer.cornerRadius = 10
        tolak.setTitle("TOLAK", for: .normal)
        tolak.setTitleColor(#colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1), for: .normal)
        tolak.addTarget(self, action: #selector(tolakAction), for: .touchUpInside)
        
        self.view.addSubview(tolak)
        
        //Terima Button
        let terima = UIButton()
        terima.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.5568627451, blue: 1, alpha: 1)
        terima.layer.borderColor = #colorLiteral(red: 0.07843137255, green: 0.5568627451, blue: 1, alpha: 1)
        terima.layer.borderWidth = 2
        terima.layer.cornerRadius = 10
        terima.setTitle("TERIMA", for: .normal)
        terima.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
        terima.addTarget(self, action: #selector(terimaAction), for: .touchUpInside)
        
        self.view.addSubview(terima)
        
        //Wording Constraint
        subject.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        status.anchor(top: subject.bottomAnchor, leading: subject.leadingAnchor, bottom: nil, trailing: subject.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        date.anchor(top: subject.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        descrip.anchor(top: separatorLine.bottomAnchor, leading: status.leadingAnchor, bottom: nil, trailing: status.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        //Separator Constraint
        separatorLine.anchor(top: status.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 15, left: 10, bottom: 10, right: 10), size: .init(width: 500, height: 1))
        
        //Tolak Button Constraint
        tolak.anchor(top: descrip.bottomAnchor, leading: descrip.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 180, height: 40))
        
        //Terima Button Constraint
        terima.anchor(top: tolak.topAnchor, leading: tolak.trailingAnchor, bottom: nil, trailing: descrip.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        terima.heightAnchor.constraint(equalTo: tolak.heightAnchor).isActive = true
        terima.widthAnchor.constraint(equalTo: tolak.widthAnchor).isActive = true
    }
    
    @objc func tolakAction(sender: UIButton!){
        print("TOLAK!")
    }
    
    @objc func terimaAction(sender: UIButton!){
        print("TERIMA!")
    }
    
}
