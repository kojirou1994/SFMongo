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
            switch self.type {
            case .string:
                return self.object as? String
            default:
                return nil
            }
        }
        set {
            if let newValue = newValue {
                self.object = NSString(string:newValue)
            } else {
                self.object = NSNull()
            }
        }
    }
    
    //Non-optional string
    public var dateValue: Date {
        get {
            switch self.type {
            case .string:
                return self.object as? String ?? ""
            case .number:
                return self.object.stringValue
            case .bool:
                return (self.object as? Bool).map { String($0) } ?? ""
            default:
                return ""
            }
        }
        set {
            self.object = NSString(string:newValue)
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
                self.object = NSString(string:newValue)
            } else {
                self.object = NSNull()
            }
        }
    }
    
    //Non-optional ObjectId
    public var oidValue: ObjectId {
        get {
            switch self.type {
            case .string:
                return self.object as? String ?? ""
            case .number:
                return self.object.stringValue
            case .bool:
                return (self.object as? Bool).map { String($0) } ?? ""
            default:
                return ""
            }
        }
        set {
            self.object = NSString(string:newValue)
        }
    }
}
