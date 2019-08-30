//
//  ChangePasswordController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 01/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class ChangePasswordController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtPass1: UITextField!
    @IBOutlet weak var txtPass2: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        txtPass1.delegate = self
        txtPass2.delegate = self
        
        tableView.tableFooterView = UIView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
    @objc func viewTapped(){
        view.endEditing(true)
    }
    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Change", style: .done, target: self, action: #selector(submitAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
        
    }
    
    @objc func submitAction(){
        view.endEditing(true)
        UserDefaults.standard.set(txtPass1.text, forKey: "passwordPlayer")
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (!txtPass1.text!.isEmpty) && (!txtPass2.text!.isEmpty) {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        else if txtPass1.text!.isEmpty {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
        
        else if txtPass2.text!.isEmpty {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }


}
