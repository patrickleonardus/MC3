//
//  RegistrationController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 27/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class PlayerRegistrationController: UITableViewController {
    
    var genders = ["Male","Female"]
    
    @IBOutlet weak var inputUserName: UITextField!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputDOB: UITextField!
    @IBOutlet weak var inputGender: UITextField!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var inputCity: UILabel!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputRetypePassword: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    
    @IBOutlet weak var inputFullname: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputPassword2: UITextField!
    @IBOutlet weak var inputDesc: UITextView!
    @IBOutlet weak var inputUsername: UITextField!
    
    
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
        setTextView()
    }
    
    func setTextView(){
        inputDesc.delegate = self
        inputDesc.text = "required"
        inputDesc.textColor = UIColor.lightGray
    }
    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitAction))
        let btnCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
        navigationItem.leftBarButtonItem = btnCancel
    }
    
    @objc func submitAction() {
        if inputPassword.text != inputRetypePassword.text {
            print("Password not match")
            return
        }
        
        let newPlayer = CKRecord(recordType: "Players")
        newPlayer.setValue(inputName.text, forKey: "name")
        newPlayer.setValue(inputUserName.text, forKey: "userName")
        newPlayer.setValue(inputCity.text, forKey: "city")
        newPlayer.setValue(inputEmail.text, forKey: "email")
        newPlayer.setValue(inputGender.text, forKey: "gender")
        newPlayer.setValue("Available", forKey: "isAvailable")
        newPlayer.setValue(inputPassword.text, forKey: "password")
        newPlayer.setValue(inputPhone.text, forKey: "phone")
        
        CKContainer.default().publicCloudDatabase.save(newPlayer) { (record, error) in
            guard record != nil else { return }
            print("success")
        }
        
        view.endEditing(true)
        
        let picture = imageProfile.image
        let imageData:NSData = picture!.pngData()! as NSData
        
        UserDefaults.standard.set(imageData, forKey: "imagePlayer")
        UserDefaults.standard.set(inputFullname.text, forKey: "fullnamePlayer")
        UserDefaults.standard.set(inputEmail.text, forKey: "emailPlayer")
        UserDefaults.standard.set(inputGender.text, forKey: "genderPlayer")
        UserDefaults.standard.set(inputDOB.text, forKey: "dobPlayer")
        UserDefaults.standard.set(inputPassword.text, forKey: "passwordPlayer")
        UserDefaults.standard.set(inputCity.text, forKey: "cityPlayer")
        UserDefaults.standard.set(inputDesc.text, forKey: "descPlayer")
        UserDefaults.standard.set(inputUsername.text, forKey: "usernamePlayer")

        UserDefaults.standard.set(true, forKey: "userCheck")
        UserDefaults.standard.set("Player", forKey: "userRole")
        
        self.dismiss(animated: true, completion: nil)
        
        
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

extension PlayerRegistrationController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if inputDesc.textColor == UIColor.lightGray {
            inputDesc.text = nil
            inputDesc.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if inputDesc.text.isEmpty {
            inputDesc.text = "required"
            inputDesc.textColor = UIColor.lightGray
        }
    }
}
