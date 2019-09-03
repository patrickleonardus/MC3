//
//  ClubEditProfileTableViewController.swift
//  esNetProfilePage
//
//  Created by Dany Hakim on 25/08/19.
//  Copyright © 2019 Dany Hakim. All rights reserved.
//

import UIKit

class ClubEditProfileTableViewController: UITableViewController{

    //temp untuk menampung nilai name,alias,team
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputAlias: UITextField!
    @IBOutlet weak var inputAboutTeam: UITextView!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPhone: UITextField!
    @IBOutlet weak var inputCity: UILabel!
    
    
    let generator = UINotificationFeedbackGenerator()
    
    var cityTemp3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButton()
        setTextView()
        loadItem()
    
        tableView.tableFooterView = UIView()
        
    }
    
    func setTextView(){
        inputAboutTeam.delegate = self
        inputAboutTeam.text = "required"
        inputAboutTeam.textColor = UIColor.lightGray
    }
    
    func loadItem(){
        let data = UserDefaults.standard.object(forKey: "imageTeam") as! NSData
        profileImage.image = UIImage(data: data as Data)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.gray.cgColor
        
        inputCity.text = UserDefaults.standard.string(forKey: "cityTeam")
    }
    
    func setButton(){
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitAction))
        let btnCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        
        navigationItem.rightBarButtonItem = btnSubmit
        navigationItem.leftBarButtonItem = btnCancel
    }
    
    @objc func submitAction(){
        
        
        var errorCheck = false
        
        if inputUsername.text == ""{
            let placeholder = NSAttributedString(string: "This field must be filled", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputUsername.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputUsername.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
            
        else if inputAlias.text == "" {
            let placeholder = NSAttributedString(string: "Input your team alias", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputAlias.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputAlias.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
            
        else if inputEmail.text == "" {
            let placeholder = NSAttributedString(string: "Input your email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputEmail.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputEmail.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
            
        else if inputPhone.text == "" {
            let placeholder = NSAttributedString(string: "Input your phone", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputPhone.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputPhone.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
            
        else if errorCheck == false {
            let picture = profileImage.image
            let imageData:NSData = picture!.pngData()! as NSData
            
            UserDefaults.standard.set(imageData, forKey: "imageTeam")
            UserDefaults.standard.set(inputAboutTeam.text, forKey: "descTeam")
            UserDefaults.standard.set(inputCity.text, forKey: "cityTeam")
            UserDefaults.standard.set(inputUsername.text, forKey: "nameTeam")
            UserDefaults.standard.set(inputAlias.text, forKey: "aliasTeam")
            UserDefaults.standard.set(inputEmail.text, forKey: "emailTeam")
            UserDefaults.standard.set(inputPhone.text, forKey: "phoneTeam")
            
            self.dismiss(animated: true, completion: nil)
            view.endEditing(true)
        }
    }
    
    
    
    @objc func cancelAction(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnSignout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "userCheck")
        performSegue(withIdentifier: "signOutFromTeam", sender: self)
    }
    
    @IBAction func btnSubmit(_ sender: Any) {
        setProfilePict()
    }
    
    @IBAction func UnwindFromCityToEditClubProfile(segue : UIStoryboardSegue){
        inputCity.text = cityTemp3
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0{
            setProfilePict()
        }
    }
}

extension ClubEditProfileTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            profileImage.image = image
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

extension ClubEditProfileTableViewController : UITextViewDelegate {
    
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
