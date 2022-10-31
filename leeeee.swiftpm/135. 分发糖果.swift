//
//  135. 分发糖果.swift
//  leeeee
//
//  Created by liang.wang on 31/10/2022.
//

import Foundation

//https://zhuanlan.zhihu.com/p/113153440
class Solution135: Solution {
    func submit() {
        print(candy([1,0,2]))
    }
    func candy(_ ratings: [Int]) -> Int {
        let size = ratings.count
        
        var vector = Array(repeating: 1, count: size)
        
        for i in 1...size - 1 {
            if ratings[i] > ratings[i - 1] {
                vector[i] = vector[i - 1] + 1
            }
        }
        
        for i in size - 2...0 {
            if ratings[i] > ratings[i + 1] {
                vector[i] = max(vector[i], vector[i + 1] + 1)
            }
        }
        
        return vector.reduce(0) { partialResult, item in
            partialResult + item
        }
        
    }
}
