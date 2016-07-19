//
//  ObjectId.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/15.
//
//

import Foundation
import libmongoc

public struct ObjectId: JSONStringConvertible, BSONStringConvertible {
    
    private(set) var oid: String
    
    public static func generate() -> ObjectId {
        var oid = bson_oid_t()
        bson_oid_init(&oid, nil)
        var str = [Int8].init(repeating: 0, count: 24)
        bson_oid_to_string(&oid, &str)
        return ObjectId(oid: String(utf8String: str)!)!
    }
    
    init?(oid: String) {
        let oidStr: String
        if oid.characters.count == 24 {
            oidStr = oid
        }
        else if oid.characters.count == 36 && oid.hasPrefix("ObjectId(\"") && oid.hasSuffix("\")") {
            oidStr = oid[10...33]!
        }
        else {
            return nil
        }
        if !bson_oid_is_valid(oidStr, oidStr.utf8.count) {
            return nil
        }
        self.oid = oidStr
    }
    
    public var timeIntervalSince1970: Int {
        var oid = bson_oid_t()
        bson_oid_init_from_string(&oid, self.oid)
        return bson_oid_get_time_t(&oid)
    }
    
    public var bsonString: String {
        get {
            return "{\"$oid\": \"\(oid)}\""
        }
    }
    
    public var jsonString: String {
        return "\"\(oid)\""
    }
}
