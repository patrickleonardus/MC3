//
//  RegistrationController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 27/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation
import UIKit

class PlayerRegistrationController: UITableViewController {
    
    var genders = ["Male","Female"]
    
    
    @IBOutlet weak var inputDOB: UITextField!
    @IBOutlet weak var inputGender: UITextField!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var inputCity: UILabel!
    
    var cityTemp1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    
    func setUpUI(){
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.borderColor = UIColor.gray.cgColor
        tableView.tableFooterView = UIView()
        setButton()
        setDatePicker()
        setGenderPicker()
    }
    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitAction))
        let btnCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
        navigationItem.leftBarButtonItem = btnCancel
    }
    
    @objc func submitAction(){
        view.endEditing(true)
    }
    
    @objc func cancelAction(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setDatePicker(){
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        inputDOB.inputView = datePicker
        
        //dismissKeyboard()
        
    }
    
    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        inputDOB.text = dateFormatter.string(from: datePicker.date)
    }
    
    func setGenderPicker(){
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        inputGender.inputView = genderPicker
        
        //dismissKeyboard()
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func btnUpload(_ sender: Any) {
        setProfilePict()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }
        
        return UITableView.automaticDimension
    }
    
    @IBAction func unwindToDetail(segue : UIStoryboardSegue){
        inputCity.text = cityTemp1
    }
    
}

extension PlayerRegistrationController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageProfile.image = image
        }
        else{
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func setProfilePict(){
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image,animated: true){}
    }
}

extension PlayerRegistrationController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputGender.text = genders[row]
    }
    
    
}
