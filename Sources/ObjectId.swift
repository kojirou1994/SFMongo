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
    
    public var oid: String
    
    public static func generate() -> ObjectId {
        var oid = bson_oid_t()
        bson_oid_init(&oid, nil)
        var str = [Int8].init(repeating: 0, count: 24)
        bson_oid_to_string(&oid, &str)
        return ObjectId(oid: String(utf8String: str)!)!
    }
    
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
    
    public var timeIntervalSince1970: Int {
        var oid = bson_oid_t()
        bson_oid_init_from_string(&oid, self.oid)
        return bson_oid_get_time_t(&oid)
    }
    
}
