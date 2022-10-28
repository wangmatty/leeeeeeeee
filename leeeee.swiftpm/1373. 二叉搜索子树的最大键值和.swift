//
//  1373. 二叉搜索子树的最大键值和.swift
//  leeeee
//
//  Created by liang.wang on 21/10/2022.
//

import Foundation

class Solution1373: Solution {
    
    var maxSum = 0
    
    func submit() {
        print(maxSumBST(treeDemoPartialBST))
    }
    func maxSumBST(_ root: TreeNode?) -> Int {
        traverse(root)
        return maxSum
    }
    
    // 返回： isBST, min, max, sum
    func traverse(_ root: TreeNode?) -> (Bool, Int, Int, Int) {
        
        if root == nil {
            return (true, Int.max, Int.min, 0)
        }
        
        let left = traverse(root?.left)
        let right = traverse(root?.right)
        
        // 这个 if 在判断以 root 为根的二叉树是不是 BST
        var result: (Bool, Int, Int, Int)  = (false, Int.max, Int.max, 0)
        if left.0 && right.0 && root!.val > left.2 && root!.val < right.1 {
            // 以 root 为根的二叉树是 BST
            result.0 = true
            
            // 计算以 root 为根的这棵 BST 的最小值
            result.1 = min(left.1, root!.val)
            
            // 计算以 root 为根的这棵 BST 的最大值
            result.2 = max(right.2, root!.val)
            
            // 计算以 root 为根的这棵 BST 所有节点之和
            result.3 = left.3 + right.3 + root!.val
            
            //更新全局变量
            maxSum = max(maxSum, result.3)
            
        } else {
            // 以 root 为根的二叉树不是 BST
            result.0 = false
            // 其他的值都没必要计算了，因为用不到
        }
        
        return result
    }
}
