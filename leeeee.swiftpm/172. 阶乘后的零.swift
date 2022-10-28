//
//  172. 阶乘后的零.swift
//  leeeee
//
//  Created by liang.wang on 26/10/2022.
//

import Foundation

// 给定一个整数 n ，返回 n! 结果中尾随零的数量。
class Solution172: Solution {
    func submit() {
    }
    func trailingZeroes(_ n: Int) -> Int {

        //解法： 0的个数是5*2，明显任何偶数都可以分解成2，所以2个个数一定大于5的个数，所以只需要求五的个数
        
        var count = 0
        var div = 5
        while div <= count {
            count += n/div
            div *= 5 // 
        }
        
        return count
    }
}
