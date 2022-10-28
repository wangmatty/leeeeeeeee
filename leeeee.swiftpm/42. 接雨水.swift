//
//  42. 接雨水.swift
//  leeeee
//
//  Created by liang.wang on 27/10/2022.
//

import Foundation

// 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
class Solution42: Solution {
    
    func submit() {
        print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
    
    // i位置的能装的水就是左边最高和右边最高的最小值 - i位置的高度
    // 第一种：暴力接发
    func trap(_ height: [Int]) -> Int {
        
        let n = height.count
        var lMax = 0
        var rMax = 0
        
        var result = 0
        
        if n <= 2 {
            return 0
        }
        
        for i in 1...n - 2 { // // 两边边界都是无法装水的
            
            // 找右边
            for j in (i + 1)...(n-1) {
                rMax = max(rMax, height[j])
            }
            
            // 左边最高的
            for j in 0...(i - 1) {
                lMax = max(lMax, height[j])
            }
            
            let h = min(lMax, rMax) - height[i]
            result += h
        
        }
        
        return result

    }
    
    // 第二种: memo方法
    func trap2(_ height: [Int]) -> Int {
        
        let n = height.count
        
        var lMemo:[Int] = Array(repeating: 0, count: n)
        var rMemo:[Int] = Array(repeating: 0, count: n)
        
        // 从左边起最大高度
        lMemo[0] = height[0]
        for i in 1...(n - 1) {
            if height[i] > lMemo[i - 1] {
               lMemo[i] = height[i]
            } else {
                lMemo[i]  = lMemo[i-1]
            }
        }
        
        // 从右边起的最大高度
        rMemo[n - 1] = height[n-1]
        for i in (n - 2)...0{
            if height[i] > rMemo[i + 1] {
               rMemo[i] = height[i]
            } else {
                rMemo[i]  = rMemo[i+1]
            }
        }
        
        // 计算总的雨水
        var result = 0
        for i in 1...(n - 2) {  // 左边右边第一个可以忽略
            result += min(lMemo[i-1], rMemo[i+1]) - height[i]
        }
        
        return result

    }
    
    // 第三种解法,双指针
    func trap3(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var lMax = 0
        var rMax = 0
        
        var result = 0
        
        while left < right {
            
            // 很容易理解，l_max 是 height[0..left] 中最高柱子的高度，r_max 是 height[right..end] 的最高柱子的高度。
            lMax = max(lMax, height[left])
            rMax = max(rMax, height[right])
            
            // 我们只在乎 min(l_max, r_max)。对于上图的情况，我们已经知道 l_max < r_max 了，至于这个 r_max 是不是右边最大的，不重要。重要的是 height[i] 能够装的水只和较低的 l_max 之差有关：
            if lMax < rMax {
                result += lMax - height[left]
                left += 1
            } else {
                result += rMax - height[right]
                right -= 1
            }
        }
        
        return result
        
    }
}
