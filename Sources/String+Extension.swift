//
//  String+Extension.swift
//  SFMongo
//
//  Created by Kojirou on 16/7/15.
//
//

import Foundation

extension String {
    subscript(bounds: ClosedRange<Int>) -> String? {
        let range = 0..<Int(self.characters.count)
        guard range.contains(bounds.lowerBound) && range.contains(bounds.upperBound) else {
            return nil
        }
        return self[index(startIndex, offsetBy: bounds.lowerBound)...index(startIndex, offsetBy: bounds.upperBound)]
    }
}
