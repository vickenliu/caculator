//
//  CaculateEngine.swift
//  Caculator
//
//  Created by Vicken on 8/07/17.
//  Copyright © 2017 Vicken. All rights reserved.
//

import Foundation

struct CaculateEngine {
    private var accumulator: Double?
    private enum Oprations {
        case const(Double)
        case unaryOperation((Double) -> Double)
        case binaryOpration((Double, Double) -> Double)
        case equal
    }
    private var operations = [
        "𝜋" : Oprations.const(Double.pi),
        "√" : Oprations.unaryOperation(sqrt),
        "X" : Oprations.binaryOpration({$0 * $1}),
        "÷" : Oprations.binaryOpration({$0 / $1}),
        "+" : Oprations.binaryOpration({$0 + $1}),
        "-" : Oprations.binaryOpration({$0 - $1}),
        "=" : Oprations.equal
    ]
    
    private struct PendingBinaryOperation {
        let function : (Double, Double) -> Double
        let firstNumber : Double
        
        func perform(with secondNumber : Double) ->  Double {
            return function(firstNumber, secondNumber)
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    mutating func performOperation(_ symbal: String) {
        if let operation = operations[symbal] {
            switch operation {
                case .const(let value):
                    accumulator = value
                case .unaryOperation(let function):
                    if accumulator != nil {
                        accumulator = function(accumulator!)
                    }
                case .binaryOpration(let function):
                    if accumulator != nil {
                        pendingBinaryOperation = PendingBinaryOperation(function: function, firstNumber: accumulator!)
                        accumulator = nil
                    }
                case .equal:
                    if pendingBinaryOperation != nil && accumulator != nil {
                        accumulator = pendingBinaryOperation!.perform(with: accumulator!)
                        pendingBinaryOperation = nil
                    }
                    break
                }
        }
    }
    
    mutating func setAccumulator (_ input: Double) {
        accumulator = input
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
