//
//  MCStatusBar.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 10/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation
import Cocoa


class MCStatusBar {
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Setup
    // ------------------------------------------------------------------------------------------
    func setupStatusBar() {
        
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.title = "04:53" // Just a test
    }
}