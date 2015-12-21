//
//  ViewController.swift
//  SwiftRoller
//
//  Created by William Rideout on 12/21/15.
//  Copyright © 2015 William Rideout. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var resultField: NSTextField!
    @IBOutlet weak var d4Count: NSTextField!
    @IBOutlet weak var d6Count: NSTextField!
    @IBOutlet weak var d8Count: NSTextField!
    @IBOutlet weak var d10Count: NSTextField!
    @IBOutlet weak var dPerCount: NSTextField!
    @IBOutlet weak var d12Count: NSTextField!
    @IBOutlet weak var d20Count: NSTextField!
    @IBOutlet weak var modifier: NSTextField!
    
    @IBAction func rollButton(sender: AnyObject) {
        //let result : Int = 57
        //let result = convertToInt(modifier.stringValue)
        let result = rollDice()
        resultField.stringValue = "Result: " + String(result)
    }
    
    func convertToInt(strVal: String) -> Int {
        let retVal: Int! = Int(strVal)
        if (retVal == nil) {
            return 0
        }
        
        return retVal
    }
    
    func rollDice() -> Int {
        var result: Int = 0
        result += rollDie(4, count:convertToInt(d4Count.stringValue))
        result += rollDie(6, count:convertToInt(d6Count.stringValue))
        result += rollDie(8, count:convertToInt(d8Count.stringValue))
        result += rollDie(10, count:convertToInt(d10Count.stringValue))
        result += rollDie(100, count:convertToInt(dPerCount.stringValue))
        result += rollDie(12, count:convertToInt(d12Count.stringValue))
        result += rollDie(20, count:convertToInt(d20Count.stringValue))

        // If a modifier was included in this roll, then add it
        return result + convertToInt(modifier.stringValue)
    }
    
    func rollDie(max: Int, count: Int) -> Int {
        if (count == 0) {
            return 0
        }
        
        var retVal: Int = 0
        for var i = 0; i < count; i++ {
            if (max == 100) {
                retVal += (Int(arc4random_uniform(UInt32(10)) + 1) * 10)
            }
            else {
                retVal += Int(arc4random_uniform(UInt32(max)) + 1)
            }
        }
        return retVal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

