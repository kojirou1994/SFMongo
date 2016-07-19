//
//  JSONConvertible.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/19.
//
//

import Foundation

public protocol JSONConvertible {
    var json: JSON {get}
    var jsonString: String {get}
}

public extension JSONConvertible {
    public var json: JSON {
        let m = Mirror(reflecting: self)
        var bsonDic = Dictionary<String, String>()
        for (label, value) in m.children {
            if label != nil && value is JSONStringConvertible {
                bsonDic[label!] = (value as! JSONStringConvertible).jsonString
            }
        }
        return JSON(bsonDic)
    }
    
    public var jsonString: String {
        let m = Mirror(reflecting: self)
        var bsonDic = Dictionary<String, Any>()
        for (label, value) in m.children {
            if label != nil && value is JSONStringConvertible {
                bsonDic[label!] = value
            }
        }
        return bsonDic.jsonString
    }
}
