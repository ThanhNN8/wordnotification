//
//  VocabularyObject.swift
//  WordNotification
//
//  Created by 11397236 on 3/1/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import UIKit
import RealmSwift

class VocabularyObject: NSObject {
    
    class func getMaxId() -> Int {
        if let lastVocabulary = try! Realm().objects(Vocabulary.self).sorted(byProperty: "id").first {
            return lastVocabulary.id + 1
        }
        
        return 1
    }
    
    class func pushNotification() {
        let arrayVocabulary = try! Realm().objects(Vocabulary.self).filter("status = 1").toArray(ofType: Vocabulary.self)
        let appDelegate = AppDelegate.getDelegate()
        if appDelegate.allowPushPermission {
            
            if arrayVocabulary.count > 3 {
                LocalPushNotification.pushNotificationDaily(hour: 8, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 9, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 10, minute: 30, title: arrayVocabulary[2].word, subTitle: arrayVocabulary[2].mean, body: arrayVocabulary[2].example, identifier: "localPush3")
                
                LocalPushNotification.pushNotificationDaily(hour: 11, minute: 30, title: arrayVocabulary[3].word, subTitle: arrayVocabulary[3].mean, body: arrayVocabulary[3].example, identifier: "localPush4")
                
                LocalPushNotification.pushNotificationDaily(hour: 14, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 15, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 16, minute: 30, title: arrayVocabulary[2].word, subTitle: arrayVocabulary[2].mean, body: arrayVocabulary[2].example, identifier: "localPush3")
                
            } else if arrayVocabulary.count > 2 {
                
                LocalPushNotification.pushNotificationDaily(hour: 8, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 9, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 10, minute: 30, title: arrayVocabulary[2].word, subTitle: arrayVocabulary[2].mean, body: arrayVocabulary[2].example, identifier: "localPush3")
                
                LocalPushNotification.pushNotificationDaily(hour: 11, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 14, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 15, minute: 30, title: arrayVocabulary[2].word, subTitle: arrayVocabulary[2].mean, body: arrayVocabulary[2].example, identifier: "localPush3")
                
                LocalPushNotification.pushNotificationDaily(hour: 16, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
            } else if arrayVocabulary.count > 1 {
                
                LocalPushNotification.pushNotificationDaily(hour: 8, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 9, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 10, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 11, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 14, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 15, minute: 30, title: arrayVocabulary[1].word, subTitle: arrayVocabulary[1].mean, body: arrayVocabulary[1].example, identifier: "localPush2")
                
                LocalPushNotification.pushNotificationDaily(hour: 16, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
            } else if arrayVocabulary.count > 0 {
                
                LocalPushNotification.pushNotificationDaily(hour: 8, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 9, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 10, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 11, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 14, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 15, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
                
                LocalPushNotification.pushNotificationDaily(hour: 16, minute: 30, title: arrayVocabulary[0].word, subTitle: arrayVocabulary[0].mean, body: arrayVocabulary[0].example, identifier: "localPush1")
            }
            
        }
    }

}
