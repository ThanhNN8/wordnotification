//
//  ViewController.swift
//  WordNotification
//
//  Created by 11397236 on 2/21/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = AppDelegate.getDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LocalPushNotification.checkPermission()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if appDelegate.allowPushPermission {
            LocalPushNotification.pushNotificationDaily(hour: 8, minute: 30, title: "Thanh", subTitle: "Thanh test", body: "Push local notification", identifier: "localPush1")
            
            LocalPushNotification.pushNotificationDaily(hour: 9, minute: 30, title: "Thanh1", subTitle: "Thanh test1", body: "Push local notification1", identifier: "localPush2")
            
            LocalPushNotification.pushNotificationDaily(hour: 10, minute: 30, title: "Thanh2", subTitle: "Thanh test2", body: "Push local notification2", identifier: "localPush3")
            
            LocalPushNotification.pushNotificationDaily(hour: 11, minute: 30, title: "Thanh2", subTitle: "Thanh test2", body: "Push local notification2", identifier: "localPush4")
            
            LocalPushNotification.pushNotificationDaily(hour: 14, minute: 30, title: "Thanh2", subTitle: "Thanh test2", body: "Push local notification2", identifier: "localPush1")
            
            LocalPushNotification.pushNotificationDaily(hour: 15, minute: 30, title: "Thanh2", subTitle: "Thanh test2", body: "Push local notification2", identifier: "localPush2")
            
            LocalPushNotification.pushNotificationDaily(hour: 16, minute: 30, title: "Thanh2", subTitle: "Thanh test2", body: "Push local notification2", identifier: "localPush3")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

