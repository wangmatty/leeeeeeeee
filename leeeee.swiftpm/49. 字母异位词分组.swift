//
//  49. 字母异位词分组.swift
//  leeeee
//
//  Created by liang.wang on 28/10/2022.
//

import Foundation

// 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

class Solution49: Solution{
    func submit() {
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
    }
    
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result: [String: [String]] = [:]
        
        for item in strs {
            let key = encode(s: String(item))
            if result[key] == nil {
              result[key] = [String(item)]
            } else {
                result[key]! += [String(item)]
            }
        }
        
        return Array(result.values)
    }
    
    // 将字符串进行编码，这样相同的字母异位词返回相同的值
    func encode(s: String) -> String {
        
        var counts: [UInt8] = Array(repeating: 0, count: 26)
        
        for item in s {
            let val = (item.asciiValue ?? 0) - (Character("a").asciiValue ?? 0)
            counts[Int(val)] += 1
        }
        
        return String(describing: counts)
    }
}
