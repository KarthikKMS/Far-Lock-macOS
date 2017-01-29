//
//  ContainerViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 29/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import Cocoa

class ContainerViewController: NSViewController {

    let searchingViewController = SearchingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchingViewController.view.frame = self.view.bounds
        
        self.addChildViewController(searchingViewController)
        self.view.addSubview(searchingViewController.view)
    }
    
}
