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
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Initialization
    // ------------------------------------------------------------------------------------------
    
    override init() {
        
        super.init(frame: CGRectMake(0.0, 0.0, 100.0, 20.0))

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Setup
    // ------------------------------------------------------------------------------------------
    
    func setup() {
    
        self.wantsLayer = true
        var color = NSColor(rgba: "#03c6ff").CGColor
        self.layer?.backgroundColor = color
    }
}