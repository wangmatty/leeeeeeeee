//
//  235. Lowest Common Ancestor of a Binary Search Tree.swift
//  leeeee
//
//  Created by liang.wang on 19/10/2022.
//

import Foundation

enum Direction {
    case left
    case right
    case no
}

// 二叉树的公共祖先： https://appktavsiei5995.pc.xiaoe-tech.com/detail/i_62987959e4b01a4852072fa5/1?from=p_629871eee4b01a48520729f7&type=6&parent_pro_id=
class Solution1644: Solution {
    func submit() {
        let result = minCameraCover(treeDemo, p: TreeNode(14), q: TreeNode(35))
        print(result?.val ?? "NOT found")
    }
    func minCameraCover(_ root: TreeNode?, p: TreeNode, q: TreeNode) -> TreeNode? {
        return find(root, val: p.val, val2: q.val)
    }
    
    
    // 寻找值为 val1 或 val2 的节点
    func find(_ root: TreeNode?, val: Int, val2: Int) -> TreeNode? {
//        print(root?.val)
        if root == nil {
            return nil
        }
        
        // 前序位置
        // 因为题目说了 p 和 q 一定存在于二叉树中(这点很重要），所以即便我们遇到 q 就直接返回，根本没遍历到 p，也依然可以断定 p 在 q 底下，q 就是 LCA 节点。 
        if root?.val == val || root?.val == val2 {
            return root
        }
        
        // root 不是目标节点，去左右子树寻找
        let left = find(root?.left, val: val, val2: val2)
        let right = find(root?.right, val: val, val2: val2)
        
        // 在 find 函数的后序位置，如果发现 left 和 right 都非空，就说明当前节点是 LCA 节点
        if (left != nil && right != nil) {
            // 当前节点是 LCA 节点
            return root;
        }
        
        // 看看哪边找到了
        return left == nil ? right : left
    }
}
