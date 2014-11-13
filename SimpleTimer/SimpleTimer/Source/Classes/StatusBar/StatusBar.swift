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
    
    var statusBar:NSStatusBar = NSStatusBar.systemStatusBar()
    var statusBarItem:NSStatusItem = NSStatusItem()
    
    
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
    }
    
    
    func setupStatusBar() {
        
        // TODO: Fix the static length
        statusBarItem = statusBar.statusItemWithLength(80.0)
        // TODO: Fix the value here, should be timer based
        statusBarItem.title = "04:53" 
        statusBarItem.image = NSImage(named:"MCClockIcon")
        statusBarItem.target = self;
        statusBarItem.action = Selector("didClickStatusBarItem:")
    }
    
    
    func setupObserver() {
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: Selector("updateCountdownDidUpdate:"),
                                                         name: NotificationName.NotificationNameUpdateCountdown.rawValue,
                                                         object: nil);
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
        
            statusBarItem.title = countDown
        }
    }
}