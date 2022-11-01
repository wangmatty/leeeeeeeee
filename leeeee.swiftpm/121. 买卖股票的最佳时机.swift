//
//  121. 买卖股票的最佳时机.swift
//  leeeee
//
//  Created by liang.wang on 1/11/2022.
//

import Foundation

//给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
//
//你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
//
//返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/best-time-to-buy-and-sell-stock
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

//这题的关键时： 只有一次买卖，如果有多次，则不一样。
class Solution121:Solution {
    func submit() {
        print(maxProfit([7,1,5,3,6,4])) //5
        print(maxProfit([7,6,4,3,1])) //0
    }
    
    //暴力解
    func maxProfi1(_ prices: [Int]) -> Int {
        
        var result = 0
        
        if prices.count <= 1 {
            return 0
        }
        
        // 思路： 由于只允许一次买卖，所以其实就是求曲线的最低和最高的差值：
        for item in prices {
            for i in 1...prices.count - 1 {
                let diff = prices[i] - item
                if diff > 0 {
                    result = max(result, diff)
                }
            }
        }

        return result
    }
    
    // 双指针
    func maxProfit2(_ prices: [Int]) -> Int {
        
        if prices.count <= 1 {
            return 0
        }
        
        var result = 0
        var minLeft = prices[0]
        var maxRight = prices.last!
        
        for i in 1...(prices.count - 1) {
            
            //先扫描左边，如果下一个数比当前还小，就直接前进，不用去比较右边
            if prices[i] > prices[i - 1] {
                minLeft = prices[i - 1]
                continue
            }
            
            // 找右边的最大
            if i + 1 < prices.count - 1 {
                for j in (i + 1)...prices.count - 1 {
                    if prices[j] > minLeft {
                        maxRight = max(maxRight, prices[j])
                    }
                }
            }
            
            // 每扫描一遍，max
            result = max(result, maxRight - minLeft)
        }
        
        return result
        
    }
    
    //最佳：https://leetcode-solution-leetcode-pp.gitbook.io/leetcode-solution/easy/121.best-time-to-buy-and-sell-stock
    func maxProfit(_ prices: [Int]) -> Int {
        var minValue = prices[0]
        var profit = 0
          // 7 1 5 3 6 4
        for i in 1...prices.count {
            if prices[i] > prices[i - 1] {
              profit = max(profit, prices[i] - minValue);
            } else {
                minValue = min(minValue, prices[i]);
            }
          }

          return profit;
    }
}
