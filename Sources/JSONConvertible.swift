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
}

extension JSONConvertible {
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
}
