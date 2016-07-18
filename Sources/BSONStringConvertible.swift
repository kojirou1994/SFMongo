//
//  BSONStringConvertible.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/18.
//
//

public protocol BSONStringConvertible {
    var bsonString: String {get}
}

extension Dictionary {
    public var jsonString: String {
        get {
            var parts: [String] = []
            for (key, value) in self {
                parts.append("\"\(key)\": \(value)")
            }
            return "{" + parts.joined(separator: ",") + "}"
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
        return self
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
