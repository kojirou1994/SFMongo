//
//  SFModel.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/19.
//
//

import Foundation

public enum SFMongoError: Error {
    case invalidData
}

public protocol JSONLiteralConvertible {
    init(json: JSON) throws
}

public protocol SFModel: JSONLiteralConvertible, JSONConvertible, BSONStringConvertible, JSONStringConvertible { }

extension SFModel {
    public var bsonString: String {
        let m = Mirror(reflecting: self)
        var bsonDic = Dictionary<String, Any>()
        for (label, value) in m.children {
            if label == nil {
                break
            }
            if let v = cast(value: value, type: Optional<BSONStringConvertible>.self) {
                bsonDic[label!] = v
            }
        }
        return bsonDic.bsonString
    }
    
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
        var jsonDic = Dictionary<String, Any>()
        for (label, value) in m.children {
            if label == nil {
                break
            }
            if let v = cast(value: value, type: Optional<JSONStringConvertible>.self) {
                jsonDic[label!] = v
            }
        }
        return jsonDic.jsonString
    }
    
    private func cast<A>(value: Any, type: A.Type) -> A? {
        return value as? A
    }
}
