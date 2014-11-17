//
//  StatusBar.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 10/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation
import Cocoa


class StatusBar:NSObject {
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem = NSStatusItem()
    var statusBarView = StatusBarView()
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Deinitialization
    // ------------------------------------------------------------------------------------------
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Setup
    // ------------------------------------------------------------------------------------------
    
    func setup() {
    
        setupObserver()
        setupStatusBar()
        setupStatusBarView()
    }
    
    
    func setupStatusBar() {
        
        // TODO: Fix the static length
        statusBarItem = statusBar.statusItemWithLength(80.0)
        statusBarItem.target = self;
        statusBarItem.action = Selector("didClickStatusBarItem:")
    }
    
    
    func setupStatusBarView() {
    
        statusBarView = StatusBarView()
        statusBarItem.view = statusBarView
    }
    
    
    func setupObserver() {
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver( self,
                        selector: Selector("updateCountdownDidUpdate:"),
                        name: NotificationName.NotificationNameUpdateCountdown.rawValue,
                        object: nil );
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Click Handling
    // ------------------------------------------------------------------------------------------
    
    func didClickStatusBarItem(item: NSStatusItem) {
        println("FUNKY!")
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Countdown update notification
    // ------------------------------------------------------------------------------------------
    
    func updateCountdownDidUpdate(aNotifcation: NSNotification) {
        
        if let countDown:String = aNotifcation.object as? NSString {
        
            statusBarView.setAttributedCountdownString(countDown)
        }
    }
}