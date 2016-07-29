//
//  JSONConvertible.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/19.
//
//

import SFJSON

public protocol JSONConvertible {
    var json: SFJSON {get}
}
