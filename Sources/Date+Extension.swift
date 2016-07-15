//
//  Date+Extension.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/15.
//
//

import Foundation

extension Date: BSONStringConvertible {
    
    public var bsonString: String {
        get {
            return "{\"$date\" : \(Int(self.timeIntervalSince1970 * 1000))}"
        }
    }
}
