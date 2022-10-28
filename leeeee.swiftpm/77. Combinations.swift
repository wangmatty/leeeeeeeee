//
//  77. Combinations.swift
//  leeeee
//
//  Created by liang.wang on 18/10/2022.
//

import Foundation

//给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。
class Solution77: Solution {
    
    func submit() {
        print(combine(3, 2))
        
    }
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        var track :[Int] = []
        var result: [[Int]] = []
        var visited: [Int: Bool] = [:]
        backtrack(track: &track)
        
        
        func backtrack(track: inout [Int]) {
            
            if track.count == k {
                result.append(track)
            }
            
            for index in 1...n {
               
                if visited[index] == true {
                    continue
                }
                visited[index] = true
                track.append(index)
                backtrack(track: &track)
                visited[index] = false
                track.removeLast()
                
            }
            
        }
        
        return result
    }
}
