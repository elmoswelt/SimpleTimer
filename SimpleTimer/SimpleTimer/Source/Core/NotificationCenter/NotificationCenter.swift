//
//  NotificationCenter.swift
//  SimpleTimer
//
//  Created by Elmar Tampe on 13/11/14.
//  Copyright (c) 2014 Elmar Tampe. All rights reserved.
//

import Foundation

enum NotificationName : NSString {

    case NotificationNameUpdateCountdown    = "NotificationCenterUpdateCountdownNotification"
    case NotificationNameTimerDidStart      = "NotificationCenterTimerDidStartNotification"
    case NotificationNameTimerDidStop       = "NotificationCenterTimerDidStopNotification"
    case NotificationNameTimerDidPause      = "NotificationCenterTimerDidPauseNotification"
}


class NotificationCenter {
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Post Countdown Update
    // ------------------------------------------------------------------------------------------
    class func postUpdateCountdownNotification(countdownString: NSString) {
    
        NotificationCenter.postNotification(NotificationName.NotificationNameUpdateCountdown.rawValue,
                                            object:countdownString,
                                            userInfo:nil)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Timer Functionality Notifications
    // ------------------------------------------------------------------------------------------
    class func postTimerDidStartNotification() {
        
        NotificationCenter.postNotification(NotificationName.NotificationNameTimerDidStart.rawValue,
                                            object:nil,
                                            userInfo:nil)
    }
    
    
    class func postTimerDidStopNotification() {
        
        NotificationCenter.postNotification(NotificationName.NotificationNameTimerDidStop.rawValue,
                                            object:nil,
                                            userInfo:nil)
    }
    
    
    class func postTimerDidPauseNotification() {
        
        NotificationCenter.postNotification(NotificationName.NotificationNameTimerDidPause.rawValue,
                                            object:nil,
                                            userInfo:nil)
    }
    

    // ------------------------------------------------------------------------------------------
    //MARK: - Generic Notification Center Post
    // ------------------------------------------------------------------------------------------
    class func postNotification(aName: String, object anObject: AnyObject?, userInfo aUserInfo: [NSObject : AnyObject]?) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(aName, object: anObject, userInfo: aUserInfo)
    }
}