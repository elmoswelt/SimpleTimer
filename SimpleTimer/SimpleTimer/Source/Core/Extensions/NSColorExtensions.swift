//
//  NSColorExtensions.swift
//  SwiftExtensions
//
//  The MIT License (MIT)
//
//  Created by Elmar Tampe on 13/11/14.
//
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import Cocoa

extension NSColor
{
    // ------------------------------------------------------------------------------------------
    //MARK: - String to Integer conversion
    // ------------------------------------------------------------------------------------------
    class func colorWithHexValue(hexValue: NSString) -> NSColor {
    
        var hexString = hexValue.stringByReplacingOccurrencesOfString("#", withString: "0x")

        var hexStringValueAsInt: uint = 0
        let scanner = NSScanner(string: hexString)
        
        var color: NSColor?
        if scanner.scanHexInt(&hexStringValueAsInt) {
        
            color = NSColor.colorWithIntegerHexValue(hexStringValueAsInt)
        }
        
        return color!
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - RGBA Color creation
    // ------------------------------------------------------------------------------------------
    class func colorWithIntegerHexValue(hexValueAsInt: uint) -> NSColor {
    
        if hexValueAsInt == 0 { return NSColor.blackColor()}
        
        let digitCount:NSInteger = NSInteger((log10(Double(hexValueAsInt)) + 1))
        
        let alpha = ((digitCount == 10) ? (((CGFloat)((hexValueAsInt & 0xFF000000) >> 24)) / 255.0) : 1.0)
        let red = ((CGFloat)((hexValueAsInt & 0xFF0000) >> 16)) / 255.0
        let green = ((CGFloat)((hexValueAsInt & 0xFF00) >> 8)) / 255.0
        let blue = ((CGFloat)(hexValueAsInt & 0xFF)) / 255.0
        
        return NSColor(calibratedRed: red, green: green, blue: blue, alpha: alpha)
    }
}
