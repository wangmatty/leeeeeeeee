//
//  111. Minimum Depth of Binary Tree.swift
//  leeeee
//
//  Created by liang.wang on 12/10/2022.
//

import Foundation





class Solution111 {
    
    func submit() {
        let result = minDepth(treeDemo)
        print("minDepth = \(result)")
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var q = Queue<TreeNode>() // 核心数据结构
        var hashIsVisited:[String: Bool] = [:]   // 避免走回头路， 本case中不需要
         var depth = 1 // 记录
        
        q.enqueue(root) // 将起点加入队列
        while !q.isEmpty {
            
            // 每个while case是二叉树的一行：
            // 1. deque出当前行的所有数据
            // 2. enque下一行数据的
            // 运行完成后，进入下一行。
            
            let count = q.count  //这句话很重要
            for _ in 0..<count {
                let cur = q.dequeue()
                if cur?.left == nil && cur?.right == nil {
                    return depth
                }
                
                if let left = cur?.left {
                    q.enqueue(left)
                }
                if let right = cur?.right {
                    q.enqueue(right)
                }
            }
            
            /* 划重点：更新 */
            depth += 1
        }
        
        return depth
    }
}
