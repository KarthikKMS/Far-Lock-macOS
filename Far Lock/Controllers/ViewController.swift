//
//  ViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 29/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var containerView: NSView!
    
    
    // MARK: - Global Constants and Variables
    
    var containerViewController: ContainerViewController?
    
    
    // MARK: - NSViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedSegue" {
            containerViewController = segue.destinationController as? ContainerViewController
        }
    }


}

