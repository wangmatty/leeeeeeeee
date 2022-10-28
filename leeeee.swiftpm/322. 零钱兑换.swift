//
//  322. 零钱兑换.swift
//  leeeee
//
//  Created by liang.wang on 25/10/2022.
//

import Foundation

//给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。
//计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。
//你可以认为每种硬币的数量是无限的。
class Solution322: Solution {
    func submit() {
        print(coinChange([1, 2, 5], 11))
    }
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        dp(coins, amount)
    }
    
    
    // dp(n) 表示，输入一个目标金额 n，返回凑出目标金额 n 所需的最少硬币数量。
    func dp(_ coins: [Int], _ amount: Int) -> Int {
        
        if amount == 0 {
            return 0
        }
        if amount < 0 {
            return -1
        }
        
        var result = Int.max //这个很重要，不能放在dp函数外面
        for coin in coins {
            
            let subProblem = dp(coins, amount - coin)
            if subProblem == -1 {
                continue
            }
            
            result = min(result, subProblem  + 1)
        }
        
        return result == Int.max ? -1 : result
    }
}
