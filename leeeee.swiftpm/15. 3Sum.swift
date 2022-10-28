//
//  15. 3Sum.swift
//  leeeee
//
//  Created by liang.wang on 17/10/2022.
//

import Foundation

class Solution015 {
    
    func submit() {
        print(threeSum([1,9,6,-4, 7, -10]))
    }
    
    func threeSum(_ nums: [Int]) -> [Int] {
        
        var hash: [Int: (Int, Int)] = [:]
        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if i != j {
                    hash[nums[i] + nums[j]] = (i,j)
                }
            }
        }
        for i in 0..<nums.count {
            if let val = hash[0-nums[i]], i != val.0 && i != val.1 {
                return [nums[val.0], nums[val.1], nums[i]]
            }
        }
        
        return []
    }
    
    
    
}
