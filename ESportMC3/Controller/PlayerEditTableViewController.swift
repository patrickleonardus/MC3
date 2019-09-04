//
//  PlayerEditTableViewController.swift
//  esNetProfilePage
//
//  Created by Dany Hakim on 27/08/19.
//  Copyright © 2019 Dany Hakim. All rights reserved.
//

import UIKit

class PlayerEditTableViewController: UITableViewController {

    @IBOutlet weak var inputAboutMe: UITextView!
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputFullname: UITextField!
    @IBOutlet weak var inputDOB: UITextField!
    @IBOutlet weak var inputDotaID: UITextField!
    @IBOutlet weak var inputGender: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputCity: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let generator = UINotificationFeedbackGenerator()
    
    
    var genders = ["Male","Female"]
    var cityTemp3 : String = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
        setTextView()
        setDatePicker()
        setGenderPicker()
        tableView.tableFooterView = UIView()
        
        let data = UserDefaults.standard.object(forKey: "imagePlayer") as! NSData
        profileImage.image = UIImage(data: data as Data)
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.gray.cgColor
        
        inputCity.text = UserDefaults.standard.string(forKey: "cityPlayer")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)) , name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        UserDefaults.standard.set("playerEdit", forKey: "vcCheck")
         navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
       
        
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
        
        else if inputFullname.text == "" {
            let placeholder = NSAttributedString(string: "Input your name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputFullname.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputFullname.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
            
        else if inputDOB.text == "" {
            let placeholder = NSAttributedString(string: "Input your date of birth", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputDOB.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputDOB.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
            
        else if inputGender.text == "" {
            let placeholder = NSAttributedString(string: "Choose your gender", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputGender.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputGender.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
        
        else if inputEmail.text == "" {
            let placeholder = NSAttributedString(string: "Input your email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            inputEmail.attributedPlaceholder = placeholder
            generator.notificationOccurred(.error)
            inputEmail.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            errorCheck = true
        }
        
        else if errorCheck == false {
            let picture = profileImage.image
            let imageData:NSData = picture!.pngData()! as NSData
            
            UserDefaults.standard.set(imageData, forKey: "imagePlayer")
            UserDefaults.standard.set(inputFullname.text, forKey: "fullnamePlayer")
            UserDefaults.standard.set(inputEmail.text, forKey: "emailPlayer")
            UserDefaults.standard.set(inputGender.text, forKey: "genderPlayer")
            UserDefaults.standard.set(inputDOB.text, forKey: "dobPlayer")
            UserDefaults.standard.set(inputCity.text, forKey: "cityPlayer")
            UserDefaults.standard.set(inputAboutMe.text, forKey: "descPlayer")
            UserDefaults.standard.set(inputDotaID.text, forKey: "usernamePlayer")
            
            self.dismiss(animated: true, completion: nil)
            view.endEditing(true)
        }
        
    }
    
    @objc func cancelAction(){
        self.dismiss(animated: true, completion: nil)
        view.endEditing(true)
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
    
    func setTextView(){
        inputAboutMe.delegate = self
        inputAboutMe.text = "required"
        inputAboutMe.textColor = UIColor.lightGray
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    @objc func keyboardWillHide(_ notification:Notification) {
        
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    @IBAction func unwindFromCityToPlayerProfile(segue : UIStoryboardSegue){
        inputCity.text = cityTemp3
        print(cityTemp3)
    }
    
    
    @IBAction func btnChoosePhoto(_ sender: Any) {
        setProfilePict()
    }
    
    @IBAction func btnSignOut(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "Are you sure, you want to sign out?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (action:UIAlertAction!) in
            UserDefaults.standard.set(false, forKey: "userCheck")
            self.performSegue(withIdentifier: "signOutFromPlayer", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    
}

extension PlayerEditTableViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
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

extension PlayerEditTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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

extension PlayerEditTableViewController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if inputAboutMe.textColor == UIColor.lightGray {
            inputAboutMe.text = nil
            inputAboutMe.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if inputAboutMe.text.isEmpty {
            inputAboutMe.text = "required"
            inputAboutMe.textColor = UIColor.lightGray
        }
    }
}

extension UITextField {
    func setBottomBorderOnlyWith(color: CGColor) {
        self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1
    }
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}
