//
//  Timer.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 10/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation


class Timer : NSObject {
    
    
    // ------------------------------------------------------------------------------------------

    var isRunning:Bool = false
    var startTime:NSTimeInterval = NSTimeInterval()
    var timer:NSTimer = NSTimer()
    var countDownValue:NSTimeInterval?
    
    // ------------------------------------------------------------------------------------------
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Singleton
    // ------------------------------------------------------------------------------------------
    class var shared : Timer {
        
        struct Static {
            static let instance : Timer = Timer()
        }
        
        return Static.instance
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Timer functionality
    // ------------------------------------------------------------------------------------------
    func start() {
        
        if countDownValue != nil {
        
            setupTimer()
            NotificationCenter.postTimerDidStartNotification()
            isRunning = true
            
        }
        else {
            println("[!] Error, no countdown set.")
        }
        
    }
    
    
    func setCountDownValue(countDownValue: NSTimeInterval) {
    
        if countDownValue < 1.0 { return }
        
        self.countDownValue = countDownValue
    }
    
    
    func stop() {
    
        timer.invalidate()
        countDownValue = nil
        isRunning = false
    }
    
    
    func alarm() {
        
       stop()
        
        // TODO: Notify the delegate that the timer has finished.
        println("ALARM! ALARM! ALARM!")
    }
    

    
    // ------------------------------------------------------------------------------------------
    //MARK: - Timer update
    // ------------------------------------------------------------------------------------------
    func updateTimer() {
        
        // The current actual time
        let currentTime:NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()

        // The time elapsed sinc the star time was set and the timer was started
        let elapsedTime:NSTimeInterval = currentTime - startTime

        // The countdown timer calling backwards from the start countdown value
        let countDownTimer:NSTimeInterval = countDownValue! - elapsedTime
        
        // Calculate the hours
        let hours:Int = Int(countDownTimer / 3600)
        
        // Calculate the minutes
        let minutes:Int = Int((countDownTimer / 60) % 60)
        
        // Calculate the seconds
        let seconds:Int = Int(countDownTimer % 60)
        
        // Align the minutes and seconds to fit the two digit style
        let strHours = hours > 9 ? String(hours):"0" + String(hours)
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        
        NotificationCenter.postUpdateCountdownNotification("\(strHours):\(strMinutes):\(strSeconds)")
        
        // Stop the countdown because it has reached its end.
        if minutes <= 0 && seconds <= 0 && hours <= 0 { alarm() }
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Helper
    // ------------------------------------------------------------------------------------------
    func setupTimer() {
    
        if (!timer.valid) {
            
            timer = NSTimer.scheduledTimerWithTimeInterval( 0.01,
                                                            target:self,
                                                            selector:Selector("updateTimer"),
                                                            userInfo:nil,
                                                            repeats:true )
     
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
}
