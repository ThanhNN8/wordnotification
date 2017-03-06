//
//  Extension.swift
//  WordNotification
//
//  Created by 11397236 on 3/1/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}

extension String {
    var localize: String {
        return NSLocalizedString(self, tableName: "localize", comment: "")
    }
}
