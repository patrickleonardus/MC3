//
//  ChangePasswordClubTableViewController.swift
//  ESportMC3
//
//  Created by Dany Hakim on 01/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class ChangePasswordClubTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtPass1: UITextField!
    @IBOutlet weak var txtPass2: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setButton()
        navigationItem.rightBarButtonItem?.isEnabled = false
        tableView.tableFooterView = UIView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
       
    }
    
    
    @objc func viewTapped(){
        view.endEditing(true)
    }

    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
    }
    
    @objc func submitAction(){
        
        UserDefaults.standard.set(txtPass1.text, forKey: "passwordTeam")
        
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (!txtPass1.text!.isEmpty) && (!txtPass2.text!.isEmpty){
             navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        else if txtPass1.text!.isEmpty {
             navigationItem.rightBarButtonItem?.isEnabled = false
        }
        
        else if txtPass2.text!.isEmpty {
             navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }

}
