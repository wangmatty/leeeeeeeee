//
//  226. Invert Binary Tree.swift
//  leeeee
//
//  Created by liang.wang on 19/10/2022.
//

import Foundation

class Solution226: Solution {
    
    func submit() {
        let result = invertTree(treeDemo)
        result?.print()
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        
        traverse(root)
        return root
        
        func traverse(_ root: TreeNode?) {
            
            if root == nil {
                return
            }
            
            let left = root?.left
            root?.left = root?.right
            root?.right = left
            
            traverse(root?.left)
            traverse(root?.right)
            
        }
        
    }
}
