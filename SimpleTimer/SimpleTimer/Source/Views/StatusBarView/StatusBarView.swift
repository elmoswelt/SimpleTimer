//
//  StatusBarView.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 13/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation
import Cocoa


// ------------------------------------------------------------------------------------------

let kcountDownTimerDefaultTime = "00:00:00"

// ------------------------------------------------------------------------------------------


class StatusBarView: NSView {
    
    var countdownTextField: NSTextField?
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Initialization
    // ------------------------------------------------------------------------------------------
    
    override init() {
        
        super.init(frame: CGRectMake(0.0, 0.0, 80.0, 22.0))

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Setup
    // ------------------------------------------------------------------------------------------
    
    func setup() {
    
        setupStatusBarView()
        setupIconImageView()
        setupTextField()
    }
    
    
    func setupStatusBarView() {
        
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.clearColor().CGColor
    }
    
    
    func setupTextField() {
    
        countdownTextField = NSTextField(frame: CGRectMake(20.0, -2.0, 60.0, 22.0))
        countdownTextField?.bezeled = false
        countdownTextField?.drawsBackground = true
        countdownTextField?.editable = false
        countdownTextField?.selectable = false
        countdownTextField?.backgroundColor = NSColor.clearColor()
        
        self.setAttributedCountdownString(kcountDownTimerDefaultTime)
        
        self.addSubview(countdownTextField!)
    }
    
    
    func setupIconImageView() {
    
        let imageView = NSImageView(frame: CGRectMake(0.0, 0.0, 22.0, 22.0))
        imageView.image = NSImage(named: "MCClockIcon")
        
        self.addSubview(imageView)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Attributed String
    // ------------------------------------------------------------------------------------------
    func setAttributedCountdownString(countDownString: NSString) {
        
        let attrString = NSAttributedString(string: countDownString, attributes: stringAttributes())
        
        countdownTextField?.attributedStringValue = attrString
    }
    
    
    func stringAttributes() -> NSDictionary {
    
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.CenterTextAlignment
        
        return [NSParagraphStyleAttributeName : paragraphStyle]
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Mouse Click Handling
    // ------------------------------------------------------------------------------------------
    override func mouseDown(theEvent: NSEvent) {
        
        showPopover()
    }
    
    override func mouseUp(theEvent: NSEvent) {
        
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Popover Handling
    // ------------------------------------------------------------------------------------------
    func showPopover() {
    
        let popover = NSPopover()
        
        popover.contentViewController = NSViewController()
        
        popover.showRelativeToRect(self.frame, ofView: self, preferredEdge: NSMinYEdge)
        
    }
    
    
    func dismissPopover(){
    
    
    }
}