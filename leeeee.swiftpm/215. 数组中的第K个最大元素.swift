//
//  215. 数组中的第K个最大元素.swift
//  leeeee
//
//  Created by liang.wang on 27/10/2022.
//

import Foundation

// 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
class Solution215: Solution {
    func submit() {
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        var minHeap = MinHeap()
        
        for i in 0..<nums.count {
            minHeap.add(nums[i])
        }
        
        for _ in 1...(nums.count - k) {
            print(minHeap.poll())
        }
        
        return minHeap.peek()!

    }
}
