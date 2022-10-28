//
//  191. 位1的个数.swift
//  leeeee
//
//  Created by liang.wang on 26/10/2022.
//


import Foundation

// 编写一个函数，输入是一个无符号整数（以二进制串的形式），返回其二进制表达式中数字位数为 '1' 的个数（也被称为汉明重量）。
class Solution191: Solution {
    func submit() {
    
    }
    func hammingWeight(_ n: Int) -> Int {
        
        var count = 0
        var nn = n
        while nn != 0 {
           nn = n & (n - 1) // 观察这个运算：n~\&~(n - 1)n & (n−1)，其运算结果恰为把 n 的二进制位中的最低位的 1 变为 0 之后的结果。
            count += 1
        }
        
        return count
        
    }
}
