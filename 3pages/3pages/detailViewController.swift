//
//  detailViewController.swift
//  3pages
//
//  Created by Vicken on 19/08/17.
//  Copyright © 2017 Vicken. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var list: List?
    
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var listOverviw: UILabel!
    @IBOutlet weak var listRate: UILabel!
    @IBOutlet weak var listYear: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        listName.text = list?.title
        listOverviw.text = list?.overview
//        listRate.text = list?.vote_average
        listYear.text = list?.release_date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
