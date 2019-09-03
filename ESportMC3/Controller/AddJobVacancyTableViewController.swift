//
//  AddJobVacancyTableViewController.swift
//  ESportMC3
//
//  Created by Dany Hakim on 29/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class AddJobVacancyTableViewController: UITableViewController {

    @IBOutlet var postJobTextField: [UITextField]!
    
    
    @IBOutlet weak var inputJobDesc: UITextView!
    @IBOutlet weak var inputRequirement: UITextView!
    @IBOutlet weak var inputCity: UILabel!
    
    
    
    var cityTemp4 = ""
    
    
    
    
    //index dalam tiap tabel
    //hint : -1 = textarea pertama dari atas, -2 = textarea kedua dari atas, -3 = Job Location label,sisanya index textfield dari 0
    let indexPostJobTable = [[0,-1,-1,-2,-2,1],[2,3],[-3]]
    override func viewDidLoad() {
        super.viewDidLoad()

        setButton()
        setTextView1()
        setTextView2()
        tableView.tableFooterView = UIView()
        
    }
    
    func setTextView1(){
        inputJobDesc.delegate = self
        inputJobDesc.text = "input your job description"
        inputJobDesc.textColor = UIColor.lightGray
        
    }
    
    func setTextView2(){
        inputRequirement.delegate = self
        inputRequirement.text = "input your job requirement"
        inputRequirement.textColor = UIColor.lightGray
    }
    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitAction))
        let btnCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
        navigationItem.leftBarButtonItem = btnCancel
    }
    
    @objc func submitAction(){
        view.endEditing(true)
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelAction(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindFromCityToAddJob(segue : UIStoryboardSegue){
        inputCity.text = cityTemp4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)

        
        
    }

}


extension AddJobVacancyTableViewController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if inputJobDesc.textColor == UIColor.lightGray && inputJobDesc.text == "input your job description"{
            inputJobDesc.text = nil
            inputJobDesc.textColor = UIColor.black
        }
        
        if inputRequirement.textColor == UIColor.lightGray && inputRequirement.text == "input your job requirement"{
            inputRequirement.text = nil
            inputRequirement.textColor = UIColor.black
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if inputJobDesc.text.isEmpty {
            inputJobDesc.text = "input your job description"
            inputJobDesc.textColor = UIColor.lightGray
        }
            
        if inputRequirement.text.isEmpty {
            inputRequirement.text = "input your job requirement"
            inputRequirement.textColor = UIColor.lightGray
        }
    }
}
