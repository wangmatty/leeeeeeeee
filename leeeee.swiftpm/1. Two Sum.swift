//
//  1. Two Sum.swift
//  leeeee
//
//  Created by liang.wang on 17/10/2022.
//

import Foundation

class Solution001 {
    
    func submit() {
        print(twoSum([2,7,11,15], 9))
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hash: [Int: Int] = [:]
        
        for (index, item) in nums.enumerated() {
            hash[item] = index
        }
        
        for (index, item) in nums.enumerated() {
            if let b = hash[target - item] {
                return [index, b]
            }
         }
        
        return []
    }
}
