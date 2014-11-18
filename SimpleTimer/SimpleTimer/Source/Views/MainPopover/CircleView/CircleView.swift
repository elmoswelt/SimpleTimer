//
//  CircleView.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 18/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Cocoa


// The colors are also applying for the little knob.
let kGrayColor = NSColor.colorWithHexValue("#C0C0C0")
let kRedColor = NSColor.colorWithHexValue("#D82026")
let kBlackColor = NSColor.colorWithHexValue("#000000")


class CircleView: NSView {

    override func drawRect(dirtyRect: NSRect)
    {
        super.drawRect(dirtyRect)
        
        let ctx = NSGraphicsContext.currentContext()?.CGContext
        
        drawBaseCircle(ctx!)
        drawRedCircle(ctx!)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Light Gray Base Circle Drawing
    // ------------------------------------------------------------------------------------------
    func drawBaseCircle(ctx: CGContext?) {
    
        CGContextSetLineWidth(ctx, 2.0);
        CGContextSetStrokeColorWithColor(ctx, kGrayColor.CGColor)
        CGContextAddArc(ctx!, width() / 2.0, width() / 2.0, 100.0, 0.0, CGFloat(M_PI * 2.0), 0)
        CGContextStrokePath(ctx);
        
    }
    
    
    func drawRedCircle(ctx: CGContext?) {
    
        CGContextSetLineWidth(ctx, 2.0);
        CGContextSetStrokeColorWithColor(ctx, kRedColor.CGColor)
        CGContextAddArc(ctx!, width() / 2.0, width() / 2.0, 100.0, 0.2, 1.5, 0)
        CGContextStrokePath(ctx);
    }
}
