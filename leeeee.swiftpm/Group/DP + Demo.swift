//
//  DP + Demo.swift
//  刷题啦
//
//  Created by liang.wang on 9/10/2022.
//

import Foundation


// 问题描述：给定一个非负整数数组和一个整数 m，你需要将这个数组分成 m 个非空的连续子数组。设计一个算法使得这 m 个子数组各自和的最大值最小。

func splitArray(nums: [Int], m: Int) -> Int {
    let length = nums.count
    
    // dp[i][j]: 给定数组大小i和分组数量j下的最大值最小
    var dp = [[Int]](repeating: [Int](repeating: .max, count: m + 1), count: length + 1)
    dp[0][0] = 0
//    dp[1][1] = nums[0]
    
    var subSum = [Int](repeating: 0, count: length + 1)
    for i in 0..<length {
        subSum[i + 1] = subSum[i] + nums[i]
    }

    for i in 1...length {
        for j in 1...min(i, m) {
            for k in 0..<i { // 不是1...i, 这是关键
                let maxmax = max(dp[k][j - 1], subSum[i] - subSum[k])
//                print(maxmax)
                dp[i][j] = min(dp[i][j], maxmax)
            }
        }
    }
    return dp[length][m]
    
}


// 备忘录
var memo: [[Int]] = []

func superEggDrop(K: Int, N: Int) -> Int {
    // m 最多不会超过 N 次（线性扫描）
    memo = [[Int]](repeating: [Int](repeating: -666, count: N + 1), count: K + 1);
    return dp(K, N);
}

// 定义：手握 K 个鸡蛋，面对 N 层楼，最少的扔鸡蛋次数为 dp(K, N)
func dp(_ K: Int, _ N: Int) -> Int {
    // base case
    if (K == 1)  { return N }
    if (N == 0)  { return 0 }

    // 查备忘录避免冗余计算
    if (memo[K][N] != -666) {
        return memo[K][N];
    }
    // 状态转移方程
    var res = Int.max;
    for i in 1...N {
        // 在所有楼层进行尝试，取最少扔鸡蛋次数
        res = min(
            res,
            // 碎和没碎取最坏情况
            max(dp(K, N - i), dp(K - 1, i - 1)) + 1
        );
    }
    // 结果存入备忘录
    memo[K][N] = res;
    return res;
}
