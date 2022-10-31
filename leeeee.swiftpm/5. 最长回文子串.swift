//
//  5. 最长回文子串.swift
//  leeeee
//
//  Created by liang.wang on 29/10/2022.
//

import Foundation

// 给你一个字符串 s，找到 s 中最长的回文子串。
class Solution005: Solution {
    func submit() {
        print(longestPalindrome("babad"))
    }
    func longestPalindrome(_ s: String) -> String {
        
        var result = ""
        for i in 0...s.count - 1 {
            //奇数
            let s1 = palindrome(s, i, i)
            //偶数
            let s2 = palindrome(s, i, i + 1)
            
            let ss = s1.count > s2.count ? s1 : s2
            
            result = result.count > ss.count ? result : ss
        }
        
        return result

    }
    
    // 这个问题的难点是： 有可能是奇数的，也可能是偶数的。   
    // 已l和r为中心的最大子串。
    // 如果是奇数，则l == r
    // 如果是偶数，则l == r + 1
    func palindrome(_ str: String, _ l: Int, _ r: Int) -> String {
        var left = l
        var right = r
        while left>=0 && r<str.count && str[left] == str[right] {
            left -= 1
            right += 1
        }
        
        return str.substring(from: left + 1, to: right - 1)
    }
}
