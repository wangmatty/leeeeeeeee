//
//  72. 编辑距离.swift
//  leeeee
//
//  Created by liang.wang on 28/10/2022.
//

import Foundation

// 给你两个单词 word1 和 word2， 请返回将 word1 转换成 word2 所使用的最少操作数  。
class Solution72: Solution {
    func submit() {
        print(minDistance("horse", "ros"))
        print(minDistance("intention", "execution"))
    }
    
    
    // 未来可优化的方法，增加memo，避免重复计算。
    
    func minDistance(_ word1: String, _ word2: String) -> Int {
        dp(s1: word1, i: word1.count - 1, s2: word2, j: word2.count - 1)
    }
    
    // 定义：返回s1[0...i]和s[0..j]的最小编辑距离
    func dp(s1: String, i: Int, s2: String, j: Int) -> Int {
        
        // base case
        if (i == -1) { return j + 1}
        if (j == -1) {return i + 1}
        
        if s1[i] == s2[j] {
            return dp(s1: s1, i: i - 1, s2: s2, j: j - 1) // 啥都不做，指针往前
        }
        
        return min(
            dp(s1: s1, i: i, s2: s2, j: j - 1) + 1, //s1进入插入操作
            dp(s1: s1, i: i - 1, s2: s2, j: j) + 1, // 删除
            dp(s1: s1, i: i - 1, s2: s2, j: j - 1) + 1  // 替换
        )
    }
}
