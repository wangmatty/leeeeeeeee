//
//  17. Letter Combinations of a Phone Number.swift
//  leeeee
//
//  Created by liang.wang on 19/10/2022.
//

import Foundation

class Solution17: Solution {
    
    func submit() {
        print(letterCombinations("23"))
    }
    func letterCombinations(_ digits: String) -> [String] {
        
        var hash: [String: [String]] = [:]
        hash["2"] = ["a", "b","c"]
        hash["3"] = ["d", "e","f"]
        hash["4"] = ["g", "h","i"]
        hash["5"] = ["j", "k","l"]
        hash["6"] = ["m", "n","o"]
        hash["7"] = ["p", "q","r"]
        hash["8"] = ["t", "u","v"]
        hash["9"] = ["w", "y","z"]
        
        var visited:[String: Bool] = [:] //字母为key
 
        var keys:[String] = []
        for item in digits {
            keys.append(String(item))
        }
        
        if digits.count == 0 {
            return []
        }
        if digits.count == 1 {
            return hash[digits[0]] ?? []
        }
        
        var result:[String] = []
        
        var track: String = ""
        
        backtrace(track: &track)
        
        func backtrace(track: inout String) {
            
            // 结束条件
            if track.count == digits.count {
                result.append(track)
            }
            
            //做选择
            for key in keys {
                
                for letter in hash[key]! {
                    
                    if visited[letter] == true {
                        continue
                    }
                    
                    track.append(letter)
                    visited[letter] = true
                    backtrace(track: &track)
                    track.removeLast()
                    visited[letter] = false
                }
            }
        }
        
        
        
        return result
    }
}
