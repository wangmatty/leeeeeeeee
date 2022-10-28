//
//  4. 寻找两个正序数组的中位数.swift
//  leeeee
//
//  Created by liang.wang on 21/10/2022.
//

import Foundation

// 未完成
class Solution004: Solution{
    
    func submit() {
        
        
    }
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var n1 = nums1
        var n2 = nums2
        
        var length = n1.count + n2.count
        
        // 确保n1是最小的，方便问题的解答
        if n1.count > n2.count {
            (n1, n2) = (n2, n1)
        }
        
        // 如果没有交集
        if n1.last! <= n2.first! {
            if length % 2 == 0 {
                let a = n2[length/2 - n1.count]
                let b = n2[length/2 - n1.count - 1]
                return Double((a+b))/2.0
            } else {
                let b = n2[length/2 - n1.count - 1]
                return Double(b)/2.0
            }
        }
        
        if n1.first! > n2.last! {
            if (n1.count + n2.count) % 2 == 0 {
                let a = n1[length/2 - n1.count - 1]
                return Double(a)/2.0
            } else {
                let a = n1[length/2 - n1.count]
                 return Double(a)/2.0
            }
        }
        
        //接下来处理交集的问题
        // 这个问题的难点在于边界的确定以及奇偶数的确定。
        // 一般采取的方法是约定。比如如果是奇数和，二分法左边的长度 = 右边的长度 + 1
        
        return 0.0

    }
}
