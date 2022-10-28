//
//  231. 2 的幂.swift
//  leeeee
//
//  Created by liang.wang on 27/10/2022.
//

import Foundation

// 给你一个整数 n，请你判断该整数是否是 2 的幂次方。如果是，返回 true ；否则，返回 false 。
class Solution231: Solution {
    func submit() {
    }
    func isPowerOfTwo(_ n: Int) -> Bool {
        
        if n <= 0 {
            return false
        }
        
        // 一个数如果是 2 的指数，那么它的二进制表示一定只含有一个 1：
        return n & (n - 1) == 0 // 这个位操作返回N的二进制的最后一个1
    }
}
