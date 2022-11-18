//
//  698. 划分为k个相等的子集.swift
//  leeeee
//
//  Created by liang.wang on 18/11/2022.
//

import Foundation

class Solution698: Solution {
    func submit() {
        let result = canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4)
        print(result)
    }
    
    // 给定一个整数数组  nums 和一个正整数 k，找出是否有可能把这个数组分成 k 个非空子集，其总和都相等。
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        if k > nums.count {
            return false
        }
        
        let sum = nums.reduce(0) { partialResult, item in
            return partialResult + item
        }
        
        // 每个桶的总和
        let target = sum/k
        var bucket = Array(repeating: 0, count: k)
        return backTrack(nums: nums, index: 0,  bucket: &bucket, target: target)

    }
    
    // index，当前选择的数字。
    // 如果找到了，则返回true
    func backTrack(nums:[Int], index: Int, bucket: inout [Int], target: Int) -> Bool {
        print(bucket)
        //退出条件
        if index == nums.count {
            for item in bucket {
                if item != target {
                    return false
                }
            }
            
            return true
        }
        
        //穷举nums[index】可装入的桶
        for i in 0..<bucket.count {
            //剪枝
            if bucket[i] + nums[index] > target {
                continue
            }
            
            // 将 nums[index] 装入 bucket[i]
            bucket[i] += nums[index]
            
            if backTrack(nums: nums, index: index + 1, bucket: &bucket, target: target) {
                return true
            }
            
            //撤销选择
            bucket[i] -= nums[index]
        }
        
        return false
    }
}
