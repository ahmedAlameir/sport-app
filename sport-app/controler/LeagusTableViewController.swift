//
//  LeagusTableViewController.swift
//  sport-app
//
//  Created by ahmed osama on 3/1/22.
//  Copyright © 2022 ahmed osama. All rights reserved.
//

import UIKit
import Kingfisher
class LeagusTableViewController: UITableViewController {
    var sportName = String()
    var leages = [League]()
    var num = Int()
    var str = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        SportController.shared.getleages(sportName: sportName) {  result in
            switch result
            {
            case .success(let leages):
                DispatchQueue.main.async {
                    self.leages=leages
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagesCell", for: indexPath)as!leagesTableViewCell
        cell.leageName.text=leages[indexPath.row].strLeague
       // print(leages[indexPath.row].strLeague)
        cell.leagesBadge.kf.setImage(with: URL(string: leages[indexPath.row].strBadge))
       

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = storyboard?.instantiateViewController(identifier: "LeageDetail") as! LeagesDetailsViewController
        view.leageName = leages[indexPath.row].strLeague
        self.present(view, animated: true, completion: nil)
    }
    
    
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
