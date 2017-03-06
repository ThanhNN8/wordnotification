//
//  Vocabulary.swift
//  WordNotification
//
//  Created by 11397236 on 3/1/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import Foundation
import RealmSwift
import BoltsSwift

class Vocabulary: Object {
    dynamic var id: Int = -1
    dynamic var word = ""
    dynamic var mean = ""
    dynamic var example = ""
    dynamic var status: Int = -1 // 0: chua hoc, 1: dang hoc, 2: da hoc
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    class func parseInBackground(data: Vocabulary, realm: DBProtocol = DBImplRealm()) -> Task<AnyObject> {
        let task = TaskCompletionSource<AnyObject>()
        DispatchQueue.main.async {
            realm.beginWrite()
            
            realm.add(object: data, update: true)
            
            try! realm.commitWrite()
            task.set(result: data)
        }
        return task.task
    }
    
    
    class func parse(data: Dictionary<String, AnyObject>) -> Vocabulary {
        let obj = Vocabulary()
        if let id = data["id"] as? Int {
            obj.id = id
        }
        if let word = data["word"] as? String {
            obj.word = word
        }
        if let mean = data["mean"] as? String {
            obj.mean = mean
        }
        if let example = data["example"] as? String {
            obj.example = example
        }
        return obj
    }
}
