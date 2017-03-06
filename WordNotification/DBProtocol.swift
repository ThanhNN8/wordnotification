//
//  DBProtocol.swift
//  gear
//
//  Created by Truc.Pham on 1/14/16.
//  Copyright © 2016 BuzzElement. All rights reserved.
//

import Foundation
import RealmSwift

protocol DBProtocol {
    func beginWrite()
    func delete(object: Object)
    func commitWrite() throws
    func add(object: Object, update: Bool)
}