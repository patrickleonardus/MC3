//
//  TeamRegistrationController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 28/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit
import CloudKit

class TeamRegistrationController: UITableViewController{

    
    @IBOutlet weak var inputAboutTeam: UITextView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var inputCity: UILabel!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputAlias: UITextField!
    @IBOutlet weak var inputYear: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputAlias: UITextField!
    @IBOutlet weak var inputYear: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var inputRetypePassword: UITextField!
    var cityTemp2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UserDefaults.standard.set("teamRegis", forKey: "vcCheck")
        self.tabBarController?.tabBar.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HomeController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setUpDelegate(){
        self.inputEmail.delegate = self
        self.inputPassword.delegate = self
        self.inputName.delegate = self
        self.inputAlias.delegate = self
        self.inputYear.delegate = self
        self.inputPhone.delegate = self
    }
    
    func setUpUI(){
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.borderColor = UIColor.gray.cgColor
        tableView.tableFooterView = UIView()
        setButton()
        setTextView()
        
    }
    
    func setTextView(){
        inputAboutTeam.delegate = self
        inputAboutTeam.text = "required"
        inputAboutTeam.textColor = UIColor.lightGray
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
        
        let newClub = CKRecord(recordType: "Clubs")
        newClub.setValue(inputName.text, forKey: "name")
        newClub.setValue(inputAlias.text, forKey: "alias")
        newClub.setValue(inputCity.text, forKey: "city")
        newClub.setValue(inputEmail.text, forKey: "email")
        newClub.setValue(inputPassword.text, forKey: "password")
        newClub.setValue("Professional eSports Club", forKey: "description")
        
        CKContainer.default().publicCloudDatabase.save(newClub) { (record, error) in
            guard record != nil else { return }
            print("success")
        }
        view.endEditing(true)
        
        let picture = imageProfile.image
        let imageData:NSData = picture!.pngData()! as NSData
        
        UserDefaults.standard.set(imageData, forKey: "imageTeam")
        UserDefaults.standard.set(inputAboutTeam.text, forKey: "descTeam")
        UserDefaults.standard.set(inputCity.text, forKey: "cityTeam")
        UserDefaults.standard.set(inputName.text, forKey: "nameTeam")
        UserDefaults.standard.set(inputAlias.text, forKey: "aliasTeam")
        UserDefaults.standard.set(inputYear.text, forKey: "yearTeam")
        UserDefaults.standard.set(inputEmail.text, forKey: "emailTeam")
        UserDefaults.standard.set(inputPassword.text, forKey: "passwordTeam")
        UserDefaults.standard.set(inputPhone.text, forKey: "phoneTeam")
        UserDefaults.standard.set(true, forKey: "userCheck")
        UserDefaults.standard.set("Team", forKey: "userRole")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelAction(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height - 60
            tableView.setBottomInset(to: keyboardHeight)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        tableView.setBottomInset(to: 0.0)
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
    
    @IBAction func btnAddPict(_ sender: Any) {
        setProfilePict()
    }
    
    
    @IBAction func unwindFromCity(segue : UIStoryboardSegue){
        inputCity.text = cityTemp2
    }
   
}

extension TeamRegistrationController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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


extension TeamRegistrationController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if inputAboutTeam.textColor == UIColor.lightGray {
            inputAboutTeam.text = nil
            inputAboutTeam.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if inputAboutTeam.text.isEmpty {
            inputAboutTeam.text = "required"
            inputAboutTeam.textColor = UIColor.lightGray
        }
    }
}

extension TeamRegistrationController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
}
