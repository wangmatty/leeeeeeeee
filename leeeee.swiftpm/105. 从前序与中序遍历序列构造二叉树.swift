//
//  105. 从前序与中序遍历序列构造二叉树.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

class Solution105: Solution {
    
    func submit() {
        
    }
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let root = traverse(preorder, inorder, preStart: 0, preEnd: preorder.count - 1, inStart: 0, inEnd: inorder.count - 1)
        return root
    }
    
    func traverse(_ preorder: [Int], _ inorder: [Int], preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {
        if preStart > preEnd {
            return nil
        }
        
        //寻找root
        let rootVal = preorder[preStart]
        
        // 寻找左边的size
        var index = 0
        for i in inStart...inEnd {
            if inorder[i] == rootVal {
                index = i
                break
            }
        }
        let leftSize = index - inStart
        
        //构造
        let root = TreeNode(rootVal)
        root.left = traverse(preorder, inorder, preStart: preStart + 1, preEnd: preStart + leftSize, inStart: inStart, inEnd: index - 1)
        root.right = traverse(preorder, inorder, preStart: preStart + leftSize + 1, preEnd: preEnd, inStart: index + 1, inEnd: inEnd)
        return root
        
    }
}
