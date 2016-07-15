//
//  ObjectId.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/15.
//
//

import Foundation
import libmongoc

public struct ObjectId: BSONStringConvertible {
    
    var oid: String
    
    init?(oid: String) {
        if oid.characters.count == 24 {
            self.oid = oid
        }
        else if oid.characters.count == 36 && oid.hasPrefix("ObjectId(\"") && oid.hasSuffix("\")") {
            self.oid = oid[10...33]!
        }
        else {
            return nil
        }
    }
    
    public var bsonString: String {
        get {
            return "{\"$oid\": \(oid)}"
        }
    }
    
}
