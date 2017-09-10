//
//  ToDoViewController.swift
//  3pages
//
//  Created by Vicken on 27/08/17.
//  Copyright © 2017 Vicken. All rights reserved.
//

import UIKit
import SafariServices

class ToDoViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var UserInput: UITextField!
    
    var toDos: [String] = ["Facebook Interview 3",
                           "iOS Podcasts",
                           "UIButton Animations"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell")
        
        cell?.textLabel?.text = "hello"
        return cell!
    }
    
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//            toDos.remove(at: indexPath.row)
//            
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
//        }
//    }
}

