//
//  1352. 最后 K 个数的乘积.swift
//  leeeee
//
//  Created by liang.wang on 25/10/2022.
//

import Foundation


class ProductOfNumbers1352: Solution {
    
    var preProduct: [Int] = [] // 从索引1开始，存储的是之前的乘机。例如index = 3，则是0,1，2，3的乘
    
    func submit() {
        self.add(3)
        self.add(0)
        self.add(2)
        self.add(5)
        self.add(4)
        print(preProduct)
    }

    init() {
        preProduct.append(1)
    }
    
    func add(_ num: Int) {
        
        // // 如果添加的元素是 0，则前面的元素积都废了。 比如倒数第二是0，则如果求最后三个的乘，则一定是0
        if num == 0 {
            preProduct = []
            preProduct.append(1)
            return
        }

        preProduct.append(preProduct.last! * num)

    }
    
    func getProduct(_ k: Int) -> Int {
        if k > preProduct.count { // 不足 k 个元素，是因为最后 k 个元素存在 0
            return 0
        }
        
        let lastIndex = preProduct.count - 1
        
        return preProduct[lastIndex] / preProduct[lastIndex - k]
    }
}
