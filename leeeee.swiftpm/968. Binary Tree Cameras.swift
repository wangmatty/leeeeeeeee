//
//  968. Binary Tree Cameras.swift
//  leeeee
//
//  Created by liang.wang on 18/10/2022.
//

import Foundation
// 给定一个二叉树，我们在树的节点上安装摄像头。
// 节点上的每个摄影头都可以监视其父对象、自身及其直接子对象。
// 计算监控树的所有节点所需的最小摄像头数量。
class Solution969: Solution {
    
    func submit() {
        print(minCameraCover(treeDemo))
    }
    
    //盖上下中三层，如果放在叶子节点，就浪费了一层的覆盖，所以把摄像头放在叶子节点的父节点位置，才能充分利用摄像头的覆盖面积。要从下往上看，让叶子节点的父节点安装摄像头，所用摄像头最少。所以用后续遍历，这是关键
    // 返回值：0表示该节点无覆盖，1表示该节点有摄像头，2表示该节点有覆盖
    func minCameraCover(_ root: TreeNode?) -> Int {
        
        var result = 0
        _ = traverse(root)
        
        func traverse(_ root: TreeNode?) -> Int {
            
            if root == nil {
                // 空节点表示有覆盖
                return 2
            }
            
            var left = traverse(root?.left)
            var right = traverse(root?.right)
            
            //如果左边或右边没有覆盖，则表明当前节点需要加个摄像头
            if left == 0 || right == 0 {
                result += 1 //表明此处需要放个摄像头是，所以result + 1
                return 1
            }
            
            //如果左右都是覆盖，当前节点不需要摄像头，否则浪费
            if left == 2 && right == 2 {
                return 0
            }
            
            // 只有左右各有一个摄像头，就能被覆盖
            if left == 1 || right == 1 {
                return 2 // 表示能被覆盖
            }
            
            return -1
        }
        
        return result
    }
}
