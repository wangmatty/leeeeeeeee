//
//  131. Palindrome Partitioning.swift
//  leeeee
//
//  Created by liang.wang on 18/10/2022.
//

import Foundation

// 给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。
class Solution131: Solution {
    
    func submit() {
        print(partition("aab"))
    }
    
    func partition(_ s: String) -> [[String]] {
        
        var track:[String] = []
        var result: [[String]] = []
        backtrack(track: &track, startIndex: 0)
        
        func backtrack(track: inout [String], startIndex: Int) {
            
            if startIndex >= s.count {
                result.append(track)
                return
            }
            
            for i in startIndex...(s.count - 1) {
                if (isPalindrome(s, startIndex, i)) {
                    let str = s.substring(from: startIndex, to: i)
                    track.append(str);
                } else {
                    continue
                }
                backtrack(track: &track, startIndex: i + 1)
                track.removeLast()
            }
        }
        
        return result
    }
    
    func isPalindrome(_ s: String, _ start: Int, _ end: Int) -> Bool {
        var pointer = 0
        
        if start == end {
            return true
        }
        if start > end {
            return false
        }
        
        for index in start...end {
            let left = index + pointer
            let right = end - pointer
            
            if left >= right {
               return true
            }
            
            if s[left] != s[right] {
                return false
            }
        }
        
        return false
    }
}
