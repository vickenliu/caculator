//
//  ViewController.swift
//  Caculator
//
//  Created by Vicken on 2/07/17.
//  Copyright © 2017 Vicken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var middleOfTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func digitTouched(sender: UIButton) {
        let digit = sender.currentTitle!
        if middleOfTyping {
            let currentDisplay = display.text!
            display.text = currentDisplay + digit
        } else {
            display.text = digit
            middleOfTyping = true
        }
    }

}

