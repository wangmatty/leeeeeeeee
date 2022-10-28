//
//  File.swift
//  
//
//  Created by liang.wang on 12/10/2022.
//

import Foundation

public class TreeNode {
    private let id: String
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0; self.left = nil; self.right = nil;
        self.id = UUID().uuidString
    }
    public init(_ val: Int) {
        self.val = val;
        self.left = nil;
        self.right = nil;
        self.id = UUID().uuidString
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
        self.id = UUID().uuidString
    }
    
    //前序输出
    func print() {
        recursive(head: self)
    }
    
    private func recursive(head: TreeNode?) {
        if head == nil {
            return
        }
        Swift.print(head!.val)
        recursive(head: head?.left)
        recursive(head: head?.right)
    }
}

// https://iowiki.com/static/cimg/data_structures_algorithms/binary_search_tree.jpg

var treeDemo: TreeNode {
    let head = TreeNode(27)
    
    let level1_1 = TreeNode(14)
    let level1_2 = TreeNode(35)
    
    let level2_1 = TreeNode(10)
    let level2_2 = TreeNode(19)
    let level2_3 = TreeNode(31)
    let level2_4 = TreeNode(42)
    
    head.left = level1_1
    head.right = level1_2
    
    level1_1.left = level2_1
    level1_1.right = level2_2
    
    level1_2.left = level2_3
    level1_2.right = level2_4
    
    return head
    
}

var treeDemoBST = treeDemo

// https://www.geeksforgeeks.org/binary-tree-data-structure/
var treeDemo2: TreeNode {
    let head = TreeNode(1)
    
    let level1_1 = TreeNode(2)
    let level1_2 = TreeNode(3)
    
    let level2_1 = TreeNode(4)
    let level2_2 = TreeNode(5)
    let level2_3 = TreeNode(6)
    let level2_4 = TreeNode(7)
    
    let level3_1 = TreeNode(8)
    let level3_2 = TreeNode(9)
    let level3_3 = TreeNode(10)
    let level3_4 = TreeNode(11)
    let level3_5 = TreeNode(13)
    let level3_6 = TreeNode(14)
    
    head.left = level1_1
    head.right = level1_2
    
    level1_1.left = level2_1
    level1_1.right = level2_2
    
    level1_2.left = level2_3
    level1_2.right = level2_4
    
    level2_1.left = level3_1
    level2_1.right = level3_2
    
    level2_2.left = level3_3
    level2_2.right = level3_4
    
    level2_3.right = level3_5
    
    level2_4.left = level3_6
    
    
    
    
    return head
    
}


// https://zhuanlan.zhihu.com/p/387577997
// 树的部分是BST
var treeDemoPartialBST: TreeNode {
    let head = TreeNode(1)
    
    let level1_1 = TreeNode(4)
    let level1_2 = TreeNode(3)
    
    let level2_1 = TreeNode(2)
    let level2_2 = TreeNode(4)
    let level2_3 = TreeNode(2)
    let level2_4 = TreeNode(5)
    
    let level3_1 = TreeNode(4)
    let level3_2 = TreeNode(6)
    
    head.left = level1_1
    head.right = level1_2
    
    level1_1.left = level2_1
    level1_1.right = level2_2
    
    level1_2.left = level2_3
    level1_2.right = level2_4
    
    level2_4.left = level3_1
    level2_4.right = level3_2
    
    return head
    
}
