//
//  PlayerEditTableViewController.swift
//  esNetProfilePage
//
//  Created by Dany Hakim on 27/08/19.
//  Copyright © 2019 Dany Hakim. All rights reserved.
//

import UIKit

class PlayerEditTableViewController: UITableViewController {

    @IBOutlet var labelEditPlayer: [UITextField]!
    //untuk declare posisi array labelEditPlayer
    let indexCellEditPlayer =
    [[0,1,-1,2,-1],[-2,-2],[-1],[-1,-1],[-1]]
    @IBOutlet weak var aboutMeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare nama username disini
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexCellEditPlayer[indexPath.section][indexPath.row] == -2{
            aboutMeTextView.becomeFirstResponder()
        }
        else if indexCellEditPlayer[indexPath.section][indexPath.row] != -1{
            labelEditPlayer[indexCellEditPlayer[indexPath.section][indexPath.row]].becomeFirstResponder()
        }
        
    }

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
