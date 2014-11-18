//
//  MainPopoverViewController.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 17/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation
import Cocoa


class MainPopoverViewController : NSViewController {
    
    
    // ------------------------------------------------------------------------------------------
    
    @IBOutlet var countDownTextField:NSTextField?
    @IBOutlet var timeUnitTextField:NSTextField?
    @IBOutlet var descriptionTextField:NSTextField?

    
    // ------------------------------------------------------------------------------------------
    //MARK: - View Lifecycle
    // ------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        
        setup()
        super.viewDidLoad()
    }
    
    
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
        setupView()
        setupDescriptionTextField()
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - View Setup
    // ------------------------------------------------------------------------------------------
    
    func setupView() {
    
        view.wantsLayer = true
    }
    
    
    func setupDescriptionTextField() {
    
        descriptionTextField?.textColor = NSColor.colorWithHexValue("#CFCFCF")
        
        if Timer.shared.isRunning {
        
            descriptionTextField?.stringValue = ""
            countDownTextField?.textColor = kRedColor
        }
        else {
            descriptionTextField?.stringValue = "SET A TIME"
            countDownTextField?.textColor = kBlackColor
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Observer
    // ------------------------------------------------------------------------------------------
    
    func setupObserver() {
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver( self,
            selector: Selector("updateCountdownDidUpdate:"),
            name: NotificationName.NotificationNameUpdateCountdown.rawValue,
            object: nil );
    
        nc.addObserver( self,
            selector: Selector("countdownDidStartNotification:"),
            name: NotificationName.NotificationNameTimerDidStop.rawValue,
            object: nil );
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Notifications
    // ------------------------------------------------------------------------------------------
    
    func updateCountdownDidUpdate(aNotifcation: NSNotification) {
        
        if let countDown:String = aNotifcation.object as? NSString {
            
            if countDown != countDownTextField?.stringValue {
                countDownTextField?.stringValue = countDown
                descriptionTextField?.stringValue = ""
            }
        }
    }
    
    
}
