//
//  Bisection + Demo.swift
//  刷题啦
//
//  Created by liang.wang on 9/10/2022.
//

import Foundation

// 问题：给定一个单调递增数组和值，求所在的第一个左边index
func getFirstLeftIndex(nums: [Int], target: Int) -> Int {
    if nums.count == 0 { return -1 }
    var left = 0
    var right = nums.count
    
    var res:[Int] = [] // 因为可能有多个相同的值，我们最后取index最小的。

    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            // 当找到 target 时，收缩右侧边界
            right = mid
            res.append(mid)
        } else if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid
        }
    }
    
    return res.min() ?? -1
}

// 问题：给定一个单调递增数组和值，求所在的第一个右边边index
func getFirstRightIndex(nums: [Int], target: Int) -> Int {
    if nums.count == 0 { return -1 }
    var left = 0
    var right = nums.count
    
    var res:[Int] = [] // 因为可能有多个相同的值，我们最后取index最小的。

    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            // 当找到 target 时，收缩左侧边界
            left = mid + 1
            res.append(mid)
        } else if nums[mid] < target {
            left = mid + 1
        } else if nums[mid] > target {
            right = mid
        }
    }
    
    return res.max() ?? -1
}

// 问题： 给定一个数组from，寻找是否存在with的子序列。如果是，返回true
// 这个问题也可以用双指针解决
func searchSubSequence(from: [String], with: [String]) -> Bool {
    
    var hash: [String: [Int]] = [:] // from中的每个值对应的index（因为有可能有多个，所以是数组）
    for (index, value) in from.enumerated() {
        if hash[value] == nil {
            hash[value] = [index]
        } else {
            hash[value] = hash[value]! + [index]
        }
    }
    
    var pointer = 0
    for (index, value) in with.enumerated() {
        if let arr = hash[value], bisearchLeft(arr: arr, val: pointer) > -1 {
            pointer = index
        } else {
            return false
        }
    }
    
    //从左边寻找刚好比val更大或者一样的。可以用二分法，因为是递增序列
    func bisearchLeft(arr: [Int], val: Int) -> Int {
        let count = arr.count
        var left = 0
        var right = arr.count - 1
        
        if arr[count - 1] < val {
            return -1 // 无法找到（因为单调递增）
        }
        
        while left < right {
           let mid = count/2
            if arr[mid] == val {
              return mid
            } else if arr[mid] > val {
                right = mid
                
            } else if arr[mid] < val {
                left = mid
            }
        }
        
        return right
        
    }
    
    return true
}
