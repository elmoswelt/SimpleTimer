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
    //MARK: - Setup
    // ------------------------------------------------------------------------------------------
    func setupStatusBar() {
        
        // TODO: Fix the static length
        statusBarItem = statusBar.statusItemWithLength(80.0)
        // TODO: Fix the value here, should be timer based
        statusBarItem.title = "04:53" 
        statusBarItem.image = NSImage(named:"MCClockIcon")
        statusBarItem.target = self;
        statusBarItem.action = Selector("didClickStatusBarItem:")
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Click Handling
    // ------------------------------------------------------------------------------------------
    func didClickStatusBarItem(item: NSStatusItem) {
        println("FUNKY!")
    }
}