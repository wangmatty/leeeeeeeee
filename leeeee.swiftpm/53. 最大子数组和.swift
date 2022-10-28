//
//  53. 最大子数组和.swift
//  leeeee
//
//  Created by liang.wang on 28/10/2022.
//

import Foundation

//给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
class Solution53: Solution {
    func submit() {
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
    }
    
    
    func maxSubArray(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        // 定义：dp[i] 记录以 nums[i] 为结尾的「最大子数组和」
        // 这个定义非常重要
        var dp:[Int] = Array(repeating: 0, count: nums.count)
        
        dp[0] = nums[0]
        for i in 1...(nums.count - 1) {
            dp[i] = max(nums[i], nums[i] + dp[i - 1]) //注意dp的定义才有这个
        }
        
        var result = Int.min
        for item in dp {
            result = max(result, item)
        }

        
        return result
    }
}
