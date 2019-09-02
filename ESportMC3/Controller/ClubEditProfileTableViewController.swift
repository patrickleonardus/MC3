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
    
    @IBOutlet var clubTextField: [UITextField]!
    @IBOutlet weak var aboutTeamTextArea: UITextView!
    //ket : -1 = textarea pertama,-2 = button password,-3 = label City,-4 = button logo,sisanya textfield dari array 0
    let indexTable = [[0,1,-1,-1],[-2],[2,3],[-3],[-4]]
    var currImageProfile:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //set unwind segue
//    @IBAction func unwindEditFromProfile(segue : UIStoryboardSegue){
//        inputLocation.text = cityTemp2
//    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            tableView.deselectRow(at: indexPath, animated: true)
        
        if indexTable[indexPath.section][indexPath.row] == -1{
           
            aboutTeamTextArea.becomeFirstResponder()
        }
        else if indexTable[indexPath.section][indexPath.row] == -2{
      performSegue(withIdentifier: "changePassword", sender: self)
        }
        else if indexTable[indexPath.section][indexPath.row] == -3{
            //pindah ke halaman location
        }
        else if indexTable[indexPath.section][indexPath.row] == -4{
         setProfilePict()
        }
        else
        {
            clubTextField[indexTable[indexPath.section][indexPath.row]].becomeFirstResponder()
        }
   
     
    }
    // MARK: - Table view data source


}

extension ClubEditProfileTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            currImageProfile = image
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
