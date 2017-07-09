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
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func digitTouched(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if middleOfTyping {
            let currentDisplay = display.text!
            if currentDisplay != "0" {
                display.text = currentDisplay + digit
            } else {
                display.text = digit
            }
        } else {
            display.text = digit
            middleOfTyping = true
        }
    }
    
    @IBAction func perform(_ sender: UIButton) {
        if middleOfTyping {
            engine.setAccumulator(displayValue)
            middleOfTyping = false
        }
        if let selectedOperator = sender.currentTitle {
            engine.performOperation(selectedOperator)
        }
        
        if let result = engine.result {
            displayValue = result
        }
    }
    
    private var engine = CaculateEngine()
    

}

