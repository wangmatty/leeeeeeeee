//
//  257. Binary Tree Paths.swift
//  leeeee
//
//  Created by liang.wang on 17/10/2022.
//

import Foundation

//核心解法： 函数参数为：当前可供选择和当前的决策路径
// 1. 加入选择
// 2. 退出条件
// 3. 进入下一个决策树
// 4. 退出选择
// 5: isVisisted的增强


class Solution257: Solution {
    
    func submit() {
        binaryTreePaths(treeDemo2)
    }
    
    
    func binaryTreePaths(_ root: TreeNode?) {
        
        var result: [String] = []
        var track = Queue<String>()
        backtrack(track: &track, select: root)
        print(result)
        
        // 当前track和当前选择
        
        func backtrack(track: inout Queue<String>, select: TreeNode?) {
            
            //加入选择
            track.enqueue("\(select!.val)")
//            print(select!.val)
            
            // 触发结束条件
            if select?.left == nil && select?.right == nil {
                let finalPath = track.elements.joined(separator: "-")
                result.append(finalPath)
                return
            }
            
            if let left = select?.left {
                backtrack(track: &track, select: left) //进入下一个决策树
                _ = track.dequeue() //回溯
            }
            
            if let right = select?.right {
                backtrack(track: &track, select: right) //进入下一个决策树
                _ = track.dequeue() //回溯
            }
            
        }
        
    }
}
