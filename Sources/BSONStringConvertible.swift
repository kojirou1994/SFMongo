//
//  BSONStringConvertible.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/18.
//
//
import Foundation

public protocol BSONStringConvertible {
    var bsonString: String {get}
}

extension BSONStringConvertible {
    
    public var bsonString: String {
        let m = Mirror(reflecting: self)
        var bsonDic = Dictionary<String, Any>()
        for (label, value) in m.children {
            if label != nil && value is BSONStringConvertible{
                bsonDic[label!] = value
            }
        }
        return bsonDic.bsonString
    }
}

extension Dictionary: BSONStringConvertible {
    public var bsonString: String {
        var parts: [String] = []
        for (key, value) in self {
            if value is BSONStringConvertible {
                parts.append("\"\(key)\": \((value as! BSONStringConvertible).bsonString)")
            }
            else {
                parts.append("\"\(key)\": \(value)")
            }
        }
        return "{" + parts.joined(separator: ",") + "}"
    }
}

extension Date: BSONStringConvertible {
    
    public var bsonString: String {
        get {
            return "{\"$date\" : \(Int(self.timeIntervalSince1970 * 1000))}"
        }
    }
}

extension Array where Element : BSONStringConvertible {
    public var bsonString: String {
        return "[" + self.map{return $0.bsonString}.joined(separator: ",") + "]"
    }
}

extension String: BSONStringConvertible {
    public var bsonString: String {
        return "\"\(self)\""
    }
}

extension Int: BSONStringConvertible {
    public var bsonString: String {
        return self.description
    }
}

extension Double: BSONStringConvertible {
    public var bsonString: String {
        return self.description
    }
}

extension Bool: BSONStringConvertible {
    public var bsonString: String {
        return self.description
    }
}
