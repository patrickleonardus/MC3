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
    @IBOutlet weak var jobDescTextArea: UITextView!
    @IBOutlet weak var requirementTextArea: UITextView!
    @IBOutlet weak var jobLocationLabel: UILabel!
    var cityTemp2 = ""
    //index dalam tiap tabel
    //hint : -1 = textarea pertama dari atas, -2 = textarea kedua dari atas, -3 = Job Location label,sisanya index textfield dari 0
    let indexPostJobTable = [[0,-1,-1,-2,-2,1],[2,3],[-3]]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //set unwind segue
    @IBAction func unwindJobFromCity(segue : UIStoryboardSegue){
      //  inputLocation.text = cityTemp2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)

        
        if indexPostJobTable[indexPath.section][indexPath.row] == -1{
            jobDescTextArea.becomeFirstResponder()
        }
        else if indexPostJobTable[indexPath.section][indexPath.row] == -2{
            requirementTextArea.becomeFirstResponder()
        }
        else if indexPostJobTable[indexPath.section][indexPath.row] == -3{
            //pindah ke halaman location
        }
        else
        {
            postJobTextField[indexPostJobTable[indexPath.section][indexPath.row]].becomeFirstResponder()
        }
        
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
