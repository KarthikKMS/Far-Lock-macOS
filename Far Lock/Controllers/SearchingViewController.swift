//
//  SearchingViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 29/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import Cocoa

class SearchingViewController: NSViewController {
    

    // MARK: - IBOutlets
    
    @IBOutlet weak var instructionLabel: NSTextField!
    @IBOutlet weak var actionButton: NSButton!
    @IBOutlet weak var searchingLabel: NSTextField!
    
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.init(calibratedRed: 228 / 365.0, green: 92 / 365.0, blue: 84 / 365.0, alpha: 1.0).cgColor
        
        switchViewBasedOnBluetoothPowerState()
    }
    
    
    // MARK: - IBActions
    
    @IBAction func actionButtonPressed(_ sender: NSButton) {
        
    }
    
    
    // MARK: - Misc. Methods
    
    private func switchViewBasedOnBluetoothPowerState() {
        let bluetoothState = true //
        if bluetoothState {
            instructionLabel.stringValue = "Start the iOS app on your iPhone"
            actionButton.isHidden = true
            searchingLabel.isHidden = false
        }
        else {
            instructionLabel.stringValue = "Please turn on bluetooth and get the iOS app"
            actionButton.title = "Turn Bluetooth ON"
            actionButton.isHidden = false
            searchingLabel.isHidden = true
        }
    }
    
}
