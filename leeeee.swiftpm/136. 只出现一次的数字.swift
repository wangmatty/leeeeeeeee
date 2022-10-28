//
//  136. 只出现一次的数字.swift
//  leeeee
//
//  Created by liang.wang on 26/10/2022.
//

import Foundation

// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
class Solution136: Solution {
    func submit() {

    }
    
    // 策略：两个相同的数字^为0， 落单的数字与0 ^ 还是本身
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0;
            for n in nums {
                res ^= n;
            }
            return res;
    }
}
