//
//  458. 可怜的小猪.swift
//  leeeee
//
//  Created by liang.wang on 3/11/2022.
//

import Foundation
import Swift


//有 buckets 桶液体，其中 正好有一桶 含有毒药，其余装的都是水。它们从外观看起来都一样。为了弄清楚哪只水桶含有毒药，你可以喂一些猪喝，通过观察猪是否会死进行判断。不幸的是，你只有 minutesToTest 分钟时间来确定哪桶液体是有毒的。
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/poor-pigs
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution458: Solution {
    func submit() {
    }
    
    // 思路：https://posts.careerengine.us/p/5d39a915efb6791c8f538d51
    // 核心在于，1只小猪能判断 minutesToTest/minutesToDie + 1 瓶水
    // 2只小猪能判断 (minutesToTest/minutesToDie + 1)^2
    // ...
    
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let base = minutesToTest/minutesToDie + 1
        
        // base ^ ans >= buckets
        // ans >= log(buckets) / log(base)
        
        let result = log(Double(buckets))/log(Double(base))
        return Int(ceil(result))

    }


}
