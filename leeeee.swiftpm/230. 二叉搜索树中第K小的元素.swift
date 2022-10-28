//
//  230. 二叉搜索树中第K小的元素.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

// BST的中序遍历是递增的
class Solution230: Solution {
    var index = 0
    var result = 0
    
    func submit() {
        print(kthSmallest(treeDemo, 2))
    }
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        traverse(root, k: k)
        return result
    }
    
    
    func traverse(_ root: TreeNode?, k: Int) {
        guard let root = root else {
            return
        }
        
        traverse(root.left, k: k)
        
        index += 1
        if index == k {
            result = root.val
            return
        }
        
        traverse(root.right, k: k)
    }
}
