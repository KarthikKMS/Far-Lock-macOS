//
//  PhoneFoundViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 29/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import Cocoa

protocol PhoneFoundViewControllerDelegate {
    func acceptButtonPressed()
    func denyButtonPressed()
}

class PhoneFoundViewController: NSViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var deviceWantsToConnectLabel: NSTextField!
    
    
    // MARK: - Global Variables and Constants
    
    var delegate: PhoneFoundViewControllerDelegate?
    
    
    // MARK: - NSViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.init(calibratedRed: 228 / 365.0, green: 92 / 365.0, blue: 84 / 365.0, alpha: 1.0).cgColor
    }
    
    
    // MARK: - IBActions
    
    @IBAction func acceptButtonPressed(_ sender: NSButton) {
        if let unwrappedDelegate = delegate {
            unwrappedDelegate.acceptButtonPressed()
        }
    }
    
    @IBAction func denyButtonPressed(_ sender: NSButton) {
        if let unwrappedDelegate = delegate {
            unwrappedDelegate.denyButtonPressed()
        }
    }
    
}
