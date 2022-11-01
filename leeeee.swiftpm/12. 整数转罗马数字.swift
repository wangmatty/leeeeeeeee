//
//  12. 整数转罗马数字.swift
//  leeeee
//
//  Created by liang.wang on 1/11/2022.
//

import Foundation

//通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
//
//I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
//X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
//C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
//给你一个整数，将其转为罗马数字。
//
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/integer-to-roman
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution012: Solution {
    func submit() {
        print(intToRoman(3))
        print(intToRoman(4))
        print(intToRoman(9))
        print(intToRoman(58))
    }
    
    
    func intToRoman(_ num: Int) -> String {
        
        let M = ["", "M", "MM", "MMM"] // 0, 1000, 2000, 3000
        let C = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"] // 0, 100, 200,...900
        let X = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"] // 0, 10, 20,... 90
        let I = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"] //0...9
        
        let m = M[(num/1000)]
        let c = C[(num%1000/100)]
        let x = X[(num%100/10)]
        let i = I[(num%10)]
        return m + c + x + i
    }
}
