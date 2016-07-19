//
//  JSONStringConvertible.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/19.
//
//

import Foundation

public protocol JSONStringConvertible {
    var jsonString: String {get}
}

extension Dictionary: JSONStringConvertible {
    public var jsonString: String {
        var parts: [String] = []
        for (key, value) in self {
            if value is JSONStringConvertible {
                parts.append("\"\(key)\": \((value as! JSONStringConvertible).jsonString)")
            }
            else {
                parts.append("\"\(key)\": \(value)")
            }
        }
        return "{" + parts.joined(separator: ",") + "}"
    }
}

extension Array where Element : JSONStringConvertible {
    public var jsonString: String {
        return "[" + self.map{return $0.jsonString}.joined(separator: ",") + "]"
    }
}

extension String: JSONStringConvertible {
    public var jsonString: String {
        return self
    }
}

extension Int: JSONStringConvertible {
    public var jsonString: String {
        return self.description
    }
}

extension Double: JSONStringConvertible {
    public var jsonString: String {
        return self.description
    }
}

extension Bool: JSONStringConvertible {
    public var jsonString: String {
        return self.description
    }
}

extension Date: JSONStringConvertible {
    public var jsonString: String {
        return self.description
    }
}
