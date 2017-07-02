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
    var selectedOperator = "+"
    var firstNumber = 0.0
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
            display.text = currentDisplay + digit
        } else {
            display.text = digit
            middleOfTyping = true
        }
    }
    
    @IBAction func perform(_ sender: UIButton) {
        selectedOperator = sender.currentTitle!
        if display.text! != "Error" {
            firstNumber = displayValue
        } else {
            firstNumber = -0.00
        }
        middleOfTyping = false;
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        middleOfTyping = false
        if firstNumber == -0.00 || display.text! == "Error" {
            display.text = "Error"
            return
        }
        switch selectedOperator {
            case "+":
                displayValue = firstNumber + displayValue
            case "-":
                displayValue = firstNumber - displayValue
            case "X":
                displayValue = firstNumber * displayValue
            case "÷":
                if displayValue == 0 {
                    display.text = "Error"
                } else {
                    displayValue = firstNumber / displayValue
                }
            default:
                break
        }
    }
}

