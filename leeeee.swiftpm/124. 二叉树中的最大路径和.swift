//
//  124. 二叉树中的最大路径和.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

class Solution124: Solution {
    
    var result = Int.min
    
    func submit() {
    }
    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = traverse(root)
        return result
    }
    
    func traverse(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let left = traverse(root.left)
        let right = traverse(root.right)
        result = max(result, left + right + root.val)
        return result
    }
}
