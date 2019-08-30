//
//  ViewController.swift
//  ESportMC3
//
//  Created by Patrick Leonardus on 20/08/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var imageHeader: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpUI()
        
    }
    
    func setUpUI(){
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = UIColor(red: 87/255, green: 84/255, blue: 92/255, alpha: 1)
        txtName.setLeftPaddingPoints(10)
        txtPassword.setLeftPaddingPoints(10)
        txtName.setRightPaddingPoints(10)
        txtPassword.setRightPaddingPoints(10)
        txtName.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        txtPassword.attributedPlaceholder = NSAttributedString(string: "Passwords", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name:UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func btnCreateAcc(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "What role that you want to register?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Register as a Player", style: .default, handler: { (action:UIAlertAction!) in
            self.performSegue(withIdentifier: "goToRegister", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "Register as a Team", style: .default, handler: { (action:UIAlertAction!) in
            self.performSegue(withIdentifier: "goToRegisterTeam", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        if UserDefaults.standard.string(forKey: "userRole") == "Player" {
            if txtName.text == UserDefaults.standard.string(forKey: "emailPlayer") && txtPassword.text == UserDefaults.standard.string(forKey: "passwordPlayer") {
                performSegue(withIdentifier: "goHome", sender: self)
            }
        }
        
    }
    

}

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
