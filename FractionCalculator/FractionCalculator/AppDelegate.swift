//
//  AppDelegate.swift
//  FractionCalculator
//
//  Created by Tobyn Packer on 9/5/18.
//  Copyright © 2018 Tobyn Packer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var display: NSTextField!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        print("done")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func click0(_ sender: NSButton) {
        let digit: Int = sender.tag
        display.stringValue += "\(digit)"
    }
    
    @IBAction func clickSubtract(_ sender: NSButton) {
        display.stringValue += "-"
    }
    
    @IBAction func clickAdd(_ sender: NSButton) {
        display.stringValue += "+"
    }
    
    @IBAction func clickMultiply(_ sender: NSButton) {
        display.stringValue += "*"
    }
    
    @IBAction func clickDivide(_ sender: NSButton) {
        display.stringValue += "/"
    }
    
    @IBAction func clickClear(_ sender: NSButton) {
        display.stringValue = ""
    }
    
    @IBAction func clickEquals(sender: NSButton) {
        if let result = Parser<Fraction>.evaluate(string: display.stringValue) {
            display.stringValue += "=\(result)"
        } else {
            display.stringValue = "Error"
        }
    }
}

