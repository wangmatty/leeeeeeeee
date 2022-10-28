//
//  File.swift
//  
//
//  Created by liang.wang on 13/10/2022.
//

import Foundation

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    mutating func replace(atIndex: Int, newChar: Character) {
        var chars = Array(self)     // gets an array of characters
        chars[atIndex] = newChar
        let modifiedString = String(chars)
        self =  modifiedString
    }
    
    // [from, to]
    func substring(from: Int?, to: Int?) -> String {
            if let start = from {
                guard start < self.count else {
                    return ""
                }
            }

            if let end = to {
                guard end >= 0 else {
                    return ""
                }
            }

            if let start = from, let end = to {
                guard end - start >= 0 else {
                    return ""
                }
            }

            let startIndex: String.Index
            if let start = from, start >= 0 {
                startIndex = self.index(self.startIndex, offsetBy: start)
            } else {
                startIndex = self.startIndex
            }

            let endIndex: String.Index
            if let end = to, end >= 0, end < self.count {
                endIndex = self.index(self.startIndex, offsetBy: end + 1)
            } else {
                endIndex = self.endIndex
            }

            return String(self[startIndex ..< endIndex])
        }
}

