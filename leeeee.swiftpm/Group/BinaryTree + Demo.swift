//
//  BinaryTree + maxDepth.swift
//  刷题啦
//
//  Created by liang.wang on 30/9/2022.
//

import Foundation

// 二叉树遍历: 最基本的
func traverseInOrder(_ root: TreeNode?) {
    
    guard let root = root else {
        return
    }
    
    //前序位置
    traverseInOrder(root.left)
    //中序位置
    print(root.val)
    traverseInOrder(root.right)
    //后序位置
}

// 二叉树遍历： 层序
func traverseLevelOrder(_ root: TreeNode?) -> LinkedList<Int> {
    let result = LinkedList<Int>()
    var q = Queue<TreeNode>()
    
    guard let root = root else {
        return result
    }
    
    q.enqueue(root)
    
    while !q.isEmpty {
        for _ in 0 ..< q.count {
            let cur: TreeNode? = q.dequeue()!
            if let left = cur?.left {
                q.enqueue(left)
            }
            if let right = cur?.right {
                q.enqueue(right)
            }
            
            if cur != nil {
                result.append(value: cur!.val)
            }
        }
    }
    
    return result
}

// 问题：输入根节点，返回这棵二叉树的最大深度
func  maxDepth(_ root: TreeNode?) -> Int {
    
    guard let root = root else {
        return 0
    }
    
    // 利用定义，计算左右子树的最大深度
    let leftMax = maxDepth(root.left);
    let rightMax = maxDepth(root.right);
    
    // 整棵树的最大深度等于左右子树的最大深度取最大值，然后再加上根节点自己
    let res = max(leftMax, rightMax) + 1;
    
//        print(value)

    return res;
    
}


//问题：输入根节点，返回这棵树的每个节点所在的层数
func listNodeLayers(_ root: TreeNode) {
    
    traverse(root, level: 1)
    
    func traverse(_ root: TreeNode?, level: Int) {
        
        guard let root = root else {
            return
        }
        
        print("Node \(root.val) 所在第\(level)层")
        traverse(root.left!, level: level + 1)
        traverse(root.right!, level: level + 1)
        
    }
    
}

// 问题： 输入一棵二叉树，返回这棵二叉树的节点总数
func listNodeCount(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    let leftCount = listNodeCount(root.left!)
    let rightCount = listNodeCount(root.right!)
    // 后序位置
    
    let result =  leftCount + rightCount
    print("节点 \(root.val) 的子节点总数 \(result)")
    return result + 1
}

// 问题： 记录最大直径的长度. 所谓二叉树的「直径」长度，就是任意两个结点之间的路径长度。最长「直径」并不一定要穿过根结点
func diameterOfBinaryTree(_ root: TreeNode) {
    
    var maxDiameter = 0
    _ = maxDepth(root)
    print("二叉树的最大直径 \(maxDiameter)")
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        
        let leftMax = maxDepth(root.left)
        let rightMax = maxDepth(root.right)
        
        // 后序位置，顺便计算最大直径
        let myDiameter = leftMax + rightMax  //这里不用 + 2
        maxDiameter = max(maxDiameter, myDiameter)
        
        return 1 + max(leftMax, rightMax)
    }
}

// 问题： 找节点

func findNode(_ root: TreeNode?, val: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    let left = findNode(root.left, val: val)
    let right = findNode(root.right, val: val)
    
    print(root.val)
    
    if root.val == val {
        return root
    }
    
    return left != nil ? left: right
}

// 问题： 二叉树反转，通过遍历
func invertTree(_ root: TreeNode?) {
    guard let root = root else {
        return
    }
    
    /**** 前序位置 ****/
    // 每一个节点需要做的事就是交换它的左右子节点
    var newRoot = root
    let temp = root.left
    
    newRoot = TreeNode(root.val, temp, root.right)
    print(newRoot.val)
    invertTree(newRoot.left)
    invertTree(newRoot.right)
    
}


// 问题： 二叉树反转：用分解问题
func invertTree2(_ root: TreeNode?) {
    guard let root = root else {
        return
    }
    
    invertTree(root.left!)
    invertTree(root.right!)
    
    //后续
    var newRoot = root
    let temp = root.left
    newRoot = TreeNode(root.val, temp, root.right)
    print(newRoot.val)
    
    
}

func convertTree2LinkedList(_ root: TreeNode) {
    
    var link = LinkedList<Int>()
    traverse(root)
    print(link)
    
    
    func traverse(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        link.append(value: root.val)
        traverse(root.left!)
        traverse(root.right!)
    }
    
}

func findRepeatTree(_ root: TreeNode) {
    var memo: [String: Int] = [:]
    let result = LinkedList<String>()
    _ = traverse(root)
    print(result)
    
    
    func traverse(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return "#"
        }
        
        let left = traverse(root.left!)
        let right = traverse(root.right!)
        
        let subTree = left + "," + right + "," + "\(root.val)"
        
        let freq = memo[subTree, default: 0]
        if freq == 1 {
            result.append(value: root.val)

        }
        
        memo[subTree] = freq + 1
        return subTree
    }
    
}
