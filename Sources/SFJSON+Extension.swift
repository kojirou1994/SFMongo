//
//  SwiftyJSON+Extension.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/15.
//
//

import Foundation
import SFJSON

extension SFJSON: BSONStringConvertible {
    public var bsonString: String {
        get {
            return self.description
        }
    }
}

// MARK: - Date

extension SFJSON {
    
    //Optional Date
    public var date: Date? {
        if let timeInterval = self["$date"].int {
            return Date(timeIntervalSince1970: Double(timeInterval) / 1000)
        }else {
            return nil
        }
    }
}

// MARK: - ObjectId

extension SFJSON {
    
    //Optional ObjectId
    public var oid: ObjectId? {
        if let oid = self["$oid"].string {
            return ObjectId(oid: oid)
        }else {
            return nil
        }
    }
}
