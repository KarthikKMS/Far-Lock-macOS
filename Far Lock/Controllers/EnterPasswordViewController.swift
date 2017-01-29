//
//  EnterPasswordViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 29/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import Cocoa

protocol EnterPasswordViewControllerDelegate {
    func cancelButtonPressed()
}

class EnterPasswordViewController: NSViewController {

    // MARK: - Global Constants and Variables
    
    var delegate: EnterPasswordViewControllerDelegate?
    
    
    // MARK: - NSViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.init(calibratedRed: 228 / 365.0, green: 92 / 365.0, blue: 84 / 365.0, alpha: 1.0).cgColor
    }
    
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonPressed(_ sender: NSButton) {
        if let unwrappedDelegate = delegate {
            unwrappedDelegate.cancelButtonPressed()
        }
    }
    
}
