//
//  96. 不同的二叉搜索树.swift
//  leeeee
//
//  Created by liang.wang on 28/10/2022.
//

import Foundation

// 给你一个整数 n ，求恰由 n 个节点组成且节点值从 1 到 n 互不相同的 二叉搜索树 有多少种？返回满足题意的二叉搜索树的种数。
class Solution96: Solution {
    func submit() {
        print(numTrees(10))
    }
    func numTrees(_ n: Int) -> Int {
        
        
        let result = count(low: 1, high: n)
        print("有\(result)种可能")
        
        return result
    }
    
    var hash: [String: Int] = [:]
    
    
    // 给定界限，返回二叉搜索树的种数
    func count(low: Int, high: Int) -> Int {
        var res = 0
        
        if low >= high {
            return 1
        }
        
        for item in low ... high {
            
            if let cache = hash["\(low)-\(high)"] {
                return cache
            }
        
            let left = count(low: low, high: item - 1)
            let right = count(low: item + 1, high: high)
            
            res += left * right
        }
        
        // 将结果存入备忘录
        hash["\(low)-\(high)"] = res
        
        return res
    }
}
