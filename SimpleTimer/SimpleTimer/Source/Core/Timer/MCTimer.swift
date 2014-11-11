//
//  MCTimer.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 10/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation


class MCTimer:NSObject {
    
    var startTime = NSTimeInterval()
    var timer : NSTimer = NSTimer()
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Timer functionality
    // ------------------------------------------------------------------------------------------
    func start() {
        
        if (!timer.valid) {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }

    
    func stop() {
        
    }
    
    
    func pause() {
        
    }
    
    
    func reset() {
        
    }
    

    func set() {
        
    }
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Timer update
    // ------------------------------------------------------------------------------------------
    func updateTimer() {
        
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel        
        print("\(strMinutes):\(strSeconds):\(strFraction) \n")
    
    }
}
