//
//  384. 打乱数组 .swift
//  leeeee
//
//  Created by liang.wang on 26/10/2022.
//

import Foundation

// 洗牌算法， 世界上最经典的
// 分析洗牌算法正确性的准则：产生的结果必须有 n! 种可能。
//对于 nums[0]，我们把它随机换到了索引 [0, n) 上，共有 n 种可能性；
//对于 nums[1]，我们把它随机换到了索引 [1, n) 上，共有 n - 1 种可能性；
//对于 nums[2]，我们把它随机换到了索引 [2, n) 上，共有 n - 2 种可能性；
class Solution384: Solution {
    
    var nums: [Int] = []
    
    func submit() {
        print(shuffle())
        print(shuffle())
    }

    init(_ nums: [Int] = [1,2,3,4,5,6]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        return nums
    }
    
    func shuffle() -> [Int] {
        var copy = nums
        for i in 0..<copy.count {
            let random = Int.random(in: i..<copy.count)
            swap(nums: &copy, i: i, j: random)
        }
        
        return copy
    }
    
    func swap(nums: inout [Int], i: Int, j: Int) {
        let temp = nums[j]
        nums[i] = nums[j]
        nums[j] = temp
    }
}
