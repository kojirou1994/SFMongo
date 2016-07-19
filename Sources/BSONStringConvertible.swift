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

extension Array: BSONStringConvertible {
    public var bsonString: String {
        return "[" + self.map{
            if $0 is BSONStringConvertible {
                return ($0 as! BSONStringConvertible).bsonString
            }else {
                return String($0)
            }}.joined(separator: ",") + "]"
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
