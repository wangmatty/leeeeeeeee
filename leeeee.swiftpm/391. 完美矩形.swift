//
//  391. 完美矩形 难度 困难  239  收藏  分享 切换为英文 接收动态 反馈 .swift
//  leeeee
//
//  Created by liang.wang on 31/10/2022.
//

import Foundation

//给你一个数组 rectangles ，其中 rectangles[i] = [xi, yi, ai, bi] 表示一个坐标轴平行的矩形。这个矩形的左下顶点是 (xi, yi) ，右上顶点是 (ai, bi) 。

// 如果所有矩形一起精确覆盖了某个矩形区域，则返回 true ；否则，返回 false 。
class Solution391: Solution {
    
    //思路：
//    1）各个矩形面积之和 == 最左、最右、最上、最下围起来的矩形面积之和；
//    2）最左、最右、最上、最下围起来的矩形四个顶点分别只出现1次，其他点都是出现偶数次
    func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
        return true
    }
}
