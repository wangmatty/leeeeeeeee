//
//  98. 验证二叉搜索树.swift
//  leeeee
//
//  Created by liang.wang on 28/10/2022.
//

import Foundation

//给你一个二叉树的根节点 root ，判断其是否是一个有效的二叉搜索树。
//
//有效 二叉搜索树定义如下：
//
//节点的左子树只包含 小于 当前节点的数。
//节点的右子树只包含 大于 当前节点的数。
//所有左子树和右子树自身必须也是二叉搜索树。
class Solution98: Solution {
    func submit() {
        print(isValidBST(treeDemoPartialBST))
        print(isValidBST(treeDemoBST))
    }
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValidBST(root: root, min: nil, max: nil)
    }
    
    
    func isValidBST(root: TreeNode?, min: TreeNode?, max: TreeNode?) -> Bool {
        
        guard let root = root else {
            return true  // 这个其实不用太纠结，最后验证就行。
        }
        
        if min != nil, root.val <= min!.val {
            return false
        }
        
        if max != nil, root.val >= max!.val {
            return false
        }
        
        return isValidBST(root: root.left, min: min, max: root) &&
        isValidBST(root: root.right, min: root, max: max)
    }
}
