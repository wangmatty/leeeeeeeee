//
//  1054. 距离相等的条形码.swift
//  leeeee
//
//  Created by liang.wang on 2/11/2022.
//

//在一个仓库里，有一排条形码，其中第 i 个条形码为 barcodes[i]。
//
//请你重新排列这些条形码，使其中任意两个相邻的条形码不能相等。 你可以返回任何满足该要求的答案，此题保证存在答案。
//
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/distant-barcodes
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation


//TODO 工作忙，还没finish整个过程
class Solution1054: Solution {
    func submit() {
        
    }
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        
        if barcodes.count <= 1 {
            return barcodes
        }
        
        var hash:[Int: Int] = [:]
        for item in barcodes {
            if hash[item] == nil {
                hash[item] = 1
            } else {
                hash[item]! += 1
            }
        }
        
        let keys = Array(hash.keys)
        var keyIndex = 0
        
        var result: [Int] = Array(repeating: -1, count: barcodes.count)
        
        var i = 0
        while i <= barcodes.count - 1 {
            
            if hash[keys[keyIndex]] ?? 0 > 0 {
                result[i] = keys[keyIndex]
                hash[keys[keyIndex]]! -= 1
            }
            
            
            i += 2
        }
        
        i = 1
        while i <= barcodes.count - 1 {
            
            i += 2
        }
        
        return []

    }
}
