//
//  LocalPushNotification.swift
//  WordNotification
//
//  Created by 11397236 on 2/21/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import Foundation
import UserNotifications

class LocalPushNotification {
    
    class func checkPermission() {
        let appDelegate = AppDelegate.getDelegate()
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
                appDelegate.allowPushPermission = false
            }
        }
    }
    
    class func pushNotificationDaily(hour: Int, minute: Int, title: String, subTitle: String, body: String, identifier:String) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.body = body
        content.sound = UNNotificationSound.default()
        
        // have to use NSCalendar for the components
        let calendar = NSCalendar(identifier: .gregorian)!;
        
        var dateFire = Date()
        
        // if today's date is passed, use tomorrow
        var fireComponents = calendar.components( [NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from:dateFire)
        
        if (fireComponents.hour! > hour
            || (fireComponents.hour == hour && fireComponents.minute! >= minute) ) {
            
            dateFire = dateFire.addingTimeInterval(86400)  // Use tomorrow's date
            fireComponents = calendar.components( [NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from:dateFire);
        }
        
        // set up the time
        fireComponents.hour = hour
        fireComponents.minute = minute
        
        // schedule local notification
        dateFire = calendar.date(from: fireComponents)!
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: dateFire)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let _ = error {
                // Something went wrong
            }
        })
    }
    
}
