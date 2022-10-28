//
//  189. 轮转数组.swift
//  leeeee
//
//  Created by liang.wang on 19/10/2022.
//

import Foundation

// 解法： 数组翻转
// 该方法为数组的翻转：我们可以先将所有元素翻转，这样尾部的 k\bmod nkmodn 个元素就被移至数组头部，然后我们再翻转 [0, k\bmod n-1][0,kmodn−1] 区间的元素和 [k\bmod n, n-1][kmodn,n−1] 区间的元素即能得到最后的答案。
class Solution189: Solution {
    func submit() {
        
    }
    func rotate(_ nums: inout [Int], _ k: Int) {
        let pp = k % nums.count
        reverse(&nums, 0, nums.count - 1);
        reverse(&nums, 0, pp - 1);
        reverse(&nums, pp, nums.count - 1);
    }
    
    // 数组反转
    func reverse(_ arr: inout [Int], _ from: Int, _ end: Int) {
        var i = 0
        for index in from...end {
            (arr[index + i], arr[end - i]) = (arr[end - i], arr[index + i])
            i += 1
        }
    }
}
