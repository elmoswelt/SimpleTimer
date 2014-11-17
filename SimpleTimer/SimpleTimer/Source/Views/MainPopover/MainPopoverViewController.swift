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
    
    @IBOutlet var countDownTextField:NSTextField?
    @IBOutlet var descriptionTextField:NSTextField?
 
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
    
        setupObserver()
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
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Notifications
    // ------------------------------------------------------------------------------------------
    
    func updateCountdownDidUpdate(aNotifcation: NSNotification) {
        
        if let countDown:String = aNotifcation.object as? NSString {
            
            if countDown != countDownTextField?.stringValue {
                countDownTextField?.stringValue = countDown
            }
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Deinitialization
    // ------------------------------------------------------------------------------------------
    
    deinit {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
}
