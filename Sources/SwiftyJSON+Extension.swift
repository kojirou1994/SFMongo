//
//  SwiftyJSON+Extension.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/15.
//
//

import Foundation

extension JSON {
    
}

// MARK: - ObjectId

extension JSON {
    
    //Optional Date
    public var date: Date? {
        get {
            if let timeInterval = self["$date"].int64 {
                return Date(timeIntervalSince1970: Double(timeInterval) / 1000)
            }
            return nil
        }
        set {
            if let newValue = newValue {
                self.object = newValue.bsonString
            } else {
                self.object = NSNull()
            }
        }
    }
}

// MARK: - ObjectId

extension JSON {
    
    //Optional ObjectId
    public var oid: ObjectId? {
        get {
            if let oid = self["$oid"].string {
                return ObjectId(oid: oid)
            }
            else {
                return nil
            }
        }
        set {
            if let newValue = newValue {
                self.object = newValue.bsonString
            } else {
                self.object = NSNull()
            }
        }
    }
}
