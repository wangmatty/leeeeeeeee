//
//  724. 寻找数组的中心下标.swift
//  leeeee
//
//  Created by liang.wang on 21/10/2022.
//

import Foundation


// 给你一个整数数组 nums ，请计算数组的 中心下标 。
// 数组 中心下标 是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。
class Solution724: Solution {
    func submit() {
        print(pivotIndex([1, 7, 3, 6, 5, 6]))
    }
    
    func pivotIndex(_ nums: [Int]) -> Int {
        
        let sum = nums.reduce(0) { partialResult, item in
            return partialResult + item
        }
        
        var total = 0
        for (index, value) in nums.enumerated() {
            if (sum - value)/2 == total {
                return index
            } else {
                total += value
            }
        }
        
        return -1
    }
}
