//
//  StatusBarView.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 13/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation
import Cocoa


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
        setupTextField()
        
    }
    
    
    func setupStatusBarView() {
        
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.redColor().CGColor
    }
    
    
    func setupTextField() {
    
        countdownTextField = NSTextField(frame: CGRectMake(20.0, -2.0, 60.0, 22.0))
        countdownTextField?.bezeled = false
        countdownTextField?.drawsBackground = true
        countdownTextField?.editable = false
        countdownTextField?.selectable = false
        countdownTextField?.backgroundColor = NSColor.greenColor()
        
        self.setAttributedCountdownString("00:00:00")
        
        self.addSubview(countdownTextField!)
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
}