//
//  122. 买卖股票的最佳时机.swift
//  leeeee
//
//  Created by liang.wang on 1/11/2022.
//

import Foundation

//给你一个整数数组 prices ，其中 prices[i] 表示某支股票第 i 天的价格。
//在每一天，你可以决定是否购买和/或出售股票。你在任何时候 最多 只能持有 一股 股票。你也可以先购买，然后在 同一天 出售。
//
//返回 你能获得的 最大 利润 。
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

//这题与121的区别在于可以多次买卖
class Solution122: Solution {
    func submit() {
        print(maxProfit([7,1,5,3,6,4])) // 7
        print(maxProfit([1,2,3,4,5])) // 4
        print(maxProfit([7,6,4,3,1])) // 0
    }
    
    
    // 贪心解法： 由于题目对于交易次数没有限制，因此只要能够赚钱的机会我们都不应该放过。
    func maxProfit1(_ prices: [Int]) -> Int {
        var profit = 0;
        for i in 1...prices.count - 1 {
            if prices[i] > prices[i - 1] {
              profit = profit + prices[i] - prices[i - 1];
            }
          }

        return profit;
    }
    
    // 动态规划
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        
        // dp[n][k]，表示第n天手上的股票k（0没有持有，1持有），返回最大的利润
        var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: count)
        
        if prices.count <= 1 {
            return 0
        }
        
        for i in 0...count - 1 {
            if i == 0 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                continue
            }
            
            //没有持有股票
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i]) //  dp[i - 1][1] + prices[i] 表示前一天持有股票，然后到了i天，要卖出，卖出就有利润prices[i]
            //持有股票
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
        }
        
        return dp[count-1][0]
    }
    
    
    
}
