//
//  26. 删除有序数组中的重复项.swift
//  leeeee
//
//  Created by liang.wang on 23/10/2022.
//

import Foundation

// 给你一个 升序排列 的数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。
class Solution26: Solution {
    func submit() {
        var val = [1,2,3,3,3,4,5,5]
        print(removeDuplicates(&val))
    }
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        if nums.count <= 1 {
            return nums.count
        }
        
        var p1 = 0
        for i in 1..<nums.count {
            if nums[p1] == nums[i] {
                
            } else {
                p1 += 1
                nums[p1] = nums[i]
            }
        }
        
        return p1 + 1

    }
}
