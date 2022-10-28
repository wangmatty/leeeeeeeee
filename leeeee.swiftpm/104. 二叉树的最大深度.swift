//
//  104. 二叉树的最大深度.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

class Solution104: Solution {
    
    var result = 0
    var depth = 0
    
    func submit() {
        print(maxDepth(treeDemo))
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        traverse(root)
        return result

    }
    
    func traverse(_ root: TreeNode? ) {
        guard let root = root else {
            result = max(result, depth)
            return
        }
        
        depth += 1
        
        print("前", root.val, depth)
    
        traverse(root.left)
        traverse(root.right)
        depth -= 1 //这个很重要

        print("后", root.val, depth)
    }
    
    // 方法2
    func traverse2(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let left = traverse2(root.left)
        let right = traverse2(root.right)
        
        return max(left + 1, right + 1)
        
    }
}
