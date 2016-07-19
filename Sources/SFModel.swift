//
//  SFModel.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/19.
//
//

import Foundation

public protocol JSONLiteralConvertible {
    init(json: JSON) throws
}



public protocol SFModel: JSONLiteralConvertible, JSONConvertible, BSONStringConvertible {
    
}
