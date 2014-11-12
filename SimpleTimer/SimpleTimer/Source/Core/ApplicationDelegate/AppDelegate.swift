//
//  AppDelegate.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 10/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    var statusBar:MCStatusBar = MCStatusBar()
    let timer:MCTimer = MCTimer.shared
    
    // ------------------------------------------------------------------------------------------
    //MARK: - AppDelegate Callbacksp
    // ------------------------------------------------------------------------------------------
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        statusBar.setupStatusBar()
        timer.setCountDownValue(5.0)
        timer.start()
    }
    

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}

