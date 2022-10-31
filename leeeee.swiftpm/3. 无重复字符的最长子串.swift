//
//  3. 无重复字符的最长子串.swift
//  leeeee
//
//  Created by liang.wang on 30/10/2022.
//

import Foundation


class Solution003: Solution {
    func submit() {
        print(lengthOfLongestSubstring("abcabcbb"))
    }
    
    //双指针
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        
        var left = 0
        var right = 0
        var result = Int.min
        var hash:[Character: Int] = [:]
        
        for item in s {
            right += 1
            
            if hash[item] == nil {
                hash[item] = 1
            } else {
                hash[item]! += 1
            }
            
            while hash[item] ?? 0 > 1 {
                left += 1
                hash[item]! -= 1
            }
            
            result = max(result, right - left)
        }
        
        return result

    }
    
    //动态规划， 待高手解答
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var result = Int.min
        
        var hash:[Character: Int] = [:] // value为字符出现的位置
        
        return result
        
        for (index, value) in s.enumerated() {
            hash[value] = index
        }
        
        
        // 表示【0, i]中的最长字符串长度
        // 待高手解答
//        func dp(_ s: String, i: Int) -> Int {
//
//            //base
//            if s.count  {
//
//            }
//
//            //sub problem
//            let c = Character(s[i])
//            if hash[c] == nil {
//                return dp(s, i: i - 1) + 1
//            } else {
//                return i - hash[c] ?? 0
//            }
//
//
//        }

    }
    
}
