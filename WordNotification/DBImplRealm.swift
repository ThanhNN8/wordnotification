//
//  DBImplRealm.swift
//  gear
//
//  Created by Truc.Pham on 1/14/16.
//  Copyright © 2016 BuzzElement. All rights reserved.
//

import Foundation
import RealmSwift

class DBImplRealm: DBProtocol {
    var realm: Realm

    init() {
        realm = try! Realm()
    }

    func beginWrite() {
        realm.beginWrite()
    }

    func delete(object: Object) {
        realm.delete(object)
    }

    func commitWrite() throws {
        try realm.commitWrite()
    }

    func add(object: Object, update: Bool) {
        realm.add(object, update: update)
    }

}