//
//  aboutViewController.swift
//  3pages
//
//  Created by Vicken on 19/08/17.
//  Copyright © 2017 Vicken. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    @IBOutlet weak var scrollAboutView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollAboutView)
        // Do any additional setup after loading the view.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollAboutView.contentSize = CGSize(width: 375, height: 1000)
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
