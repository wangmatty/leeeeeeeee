//
//  209. 长度最小的子数组.swift
//  leeeee
//
//  Created by liang.wang on 31/10/2022.
//

import Foundation

class Solution209: Solution {
    func submit() {
        print(minSubArrayLen(7, [2,3,1,2,4,3]))
    }
    
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        
        var sums:[Int] = Array(repeating: 0, count: nums.count + 1) // sums[0] 没用，sums[1]表示前1个数，不包括sums[1]
        
        sums[0] = 0
        for i in 0...nums.count - 1 {
           sums[i + 1] = nums[i] + sums[i]
        }
        
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1  {
            return nums[0] >= target ? 1 : 0
        }
        
        
        var result = Int.max
        for i in 0...nums.count - 1 {
            
            var j = i + 1
            
            while j <= nums.count { //注意这里的上限
                if ( sums[j] - sums[i] >= target)  {
                    result = min(result, j - i)
                    break
                }
                j += 1
            }
            
        }
        
        return result == Int.max ? 0 : result

    }
}
