//
//  TeamRegistrationController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 28/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class TeamRegistrationController: UITableViewController {

    
    @IBOutlet weak var inputAboutTeam: UITextView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var inputCity: UILabel!
    
    var cityTemp2 = ""
    
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
    
    @objc func submitAction(){
        view.endEditing(true)
        
        UserDefaults.standard.set(true, forKey: "userCheck")
        UserDefaults.standard.set("Team", forKey: "userRole")
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "Login")
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    @objc func cancelAction(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
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
    
    func dismissKeyboard(){
        view.endEditing(true)
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
