//
//  NSViewExtensions.swift
//  SwiftExtensions
//
//  The MIT License (MIT)
//
//  Created by Elmar Tampe on 08/08/14.
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


extension NSView
{
    // ------------------------------------------------------------------------------------------
    // MARK: Left
    // ------------------------------------------------------------------------------------------
    func left(left: CGFloat)
    {
        let frame = CGRectMake(left, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        
        self.frame = frame;
    }
    
    
    func left() -> CGFloat
    {
        return self.frame.origin.y
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Right
    // ------------------------------------------------------------------------------------------
    func right(right: CGFloat)
    {
        let originX = self.frame.origin.x + self.frame.size.width + right
        let frame = CGRectMake(originX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        
        self.frame = frame;
    }
    
    
    func right() -> CGFloat
    {
        return self.frame.origin.y + self.frame.size.width
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Top
    // ------------------------------------------------------------------------------------------
    func top(top: CGFloat)
    {
        let originY =  self.frame.origin.y - self.frame.size.height + top;
        let frame = CGRectMake(self.frame.origin.x, originY, self.frame.size.width, self.frame.size.height);
        
        self.frame = frame
    }
    
    
    func top() -> CGFloat
    {
        return self.frame.origin.y + self.frame.size.height
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Bottom
    // ------------------------------------------------------------------------------------------
    func bottom(bottom: CGFloat)
    {
        let originY =  self.frame.origin.y + bottom;
        let frame = CGRectMake(self.frame.origin.x, originY, self.frame.size.width, self.frame.size.height);
        
        self.frame = frame
    }
    
    
    func bottom() -> CGFloat
    {
        return self.frame.origin.y
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Center
    // ------------------------------------------------------------------------------------------
    func center(center: CGPoint)
    {
        let originX = center.x - (self.frame.size.width / 2.0)
        let originY = center.y - (self.frame.size.height / 2.0)

        let frame = CGRectMake(originX, originY, self.frame.size.width, self.frame.size.height);
        
        self.frame = frame
    }
    
    
    func center() -> CGPoint
    {
        let centerX = self.frame.origin.x + (self.frame.size.width / 2.0)
        let centerY = self.frame.origin.y + (self.frame.size.height / 2.0)
        
        return CGPointMake(centerX, centerY)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Width
    // ------------------------------------------------------------------------------------------
    func width(width: CGFloat)
    {
        let frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
        
        self.frame = frame
    }
    
    
    func width() -> CGFloat
    {
        return self.frame.size.width
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Height
    // ------------------------------------------------------------------------------------------
    func height(height: CGFloat)
    {
        let frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
        
        self.frame = frame
    }
    
    
    func height() -> CGFloat
    {
        return self.frame.size.height
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Size
    // ------------------------------------------------------------------------------------------
    func size(size: CGSize)
    {
        let frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height)

        self.frame = frame
    }
    
    
    func size() -> CGSize
    {
        return self.frame.size;
    }
}
