//
//  listsViewController.swift
//  3pages
//
//  Created by Vicken on 19/08/17.
//  Copyright © 2017 Vicken. All rights reserved.
//

import UIKit
import SwiftSpinner

class listsViewController: UITableViewController {
    
    var lists: [AnyObject]? {
        didSet {
            print("i have set done")
            tableView.reloadData()
        }
    }
    
    let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=a9cdd0e23d8a5391db7174cf0ad20f5e&language=en-US&sort_by=popularity.desc&include_adult=true&include_video=false&page=1")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftSpinner.show("Connecting to satellite...")
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if err != nil {
                print("fetching data error")
                return
            }
            SwiftSpinner.hide()
            guard let data = data else { return }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
                let results = response["results"] as! NSArray
                self.lists = results as [AnyObject]
                print(results)
            } catch let jsonErr {
                print ("sterilize json error", jsonErr)
            }
            
        }.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let lists = lists {
            return lists.count
        }
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = lists?[indexPath.row]["title"] as? String
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            let detailVC = segue.destination as? detailViewController
//            if let cell = sender as? UITableViewCell {
//                if indexPath = tableView.indexPath(for: cell) {
//                    detailVC?.list = lists[indexPath.row]
//                }
//            }
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPath(for: cell) else {
                return
            }
            guard let selectedList = lists?[indexPath.row] else {
                return
            }
            let list = List()
            let imageUrl: String = "https://image.tmdb.org/t/p/w500"
            list.title = selectedList["title"] as? String
            list.overview = selectedList["overview"] as? String
            list.release_date = selectedList["release_date"] as? String
            list.vote_average = selectedList["vote_average,"] as? Double
            list.listImageUrl = imageUrl + (selectedList["poster_path"] as? String)!
            detailVC?.list = list
        }
    }

}
