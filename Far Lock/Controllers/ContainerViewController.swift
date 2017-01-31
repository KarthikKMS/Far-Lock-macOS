//
//  ContainerViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 29/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import Cocoa

class ContainerViewController: NSViewController {

    // MARK: - Global Variables and Constants
    
    let searchingViewController = SearchingViewController()
    
    
    // MARK: - NSViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchingViewController.view.frame = self.view.bounds
        
        self.addChildViewController(searchingViewController)
        self.view.addSubview(searchingViewController.view)

        
        // delete start
//        let phoneFoundViewController = PhoneFoundViewController()
//        phoneFoundViewController.delegate = self
//        switchChildViewController(to: phoneFoundViewController)
        // delete end
    }
    
    
    // MARK: - Misc. Methods
    
    func switchChildViewController(to newChildViewController: NSViewController) {
        let currentChildViewController = self.childViewControllers[0]
        currentChildViewController.view.removeFromSuperview()
        self.childViewControllers[0] = newChildViewController
        newChildViewController.view.frame = self.view.bounds
        self.view.addSubview(newChildViewController.view)
    }
    
}


// MARK: - PhoneFoundViewControllerDelegate Methods

extension ContainerViewController: PhoneFoundViewControllerDelegate {
    func acceptButtonPressed() {
        let enterPasswordViewController = EnterPasswordViewController()
        enterPasswordViewController.delegate = self
        switchChildViewController(to: enterPasswordViewController)
    }
    
    func denyButtonPressed() {
        switchChildViewController(to: searchingViewController)
    }
}


// MARK: - EnterPasswordViewControllerDelegate Methods

extension ContainerViewController: EnterPasswordViewControllerDelegate {
    func cancelButtonPressed() {
        switchChildViewController(to: searchingViewController)
    }
}
