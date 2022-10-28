//
//  46. Permutations.swift
//  leeeee
//
//  Created by liang.wang on 18/10/2022.
//

import Foundation

class Solution46:  Solution {
    
    func submit() {
        print(permute([1,2,3]))
    }
    
    
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var result: [[Int]] = []
        var track: [Int] = []
        var used:[Int: Bool] = [:]
        
        backtrace(track: &track)
        return result
        
        func backtrace(track: inout [Int]) {
            
            // 退出条件
            if track.count == nums.count {
                result.append(track)
                return
            }
            
            for item in nums {
                
                if used[item] == true {
                    continue
                }
                
                used[item] = true
                //做选择：
//                print(used)
                track.append(item)
                backtrace(track: &track)
                track.removeLast() //回溯
                used[item] = false
            }
            
            
        }
        
    }
}
