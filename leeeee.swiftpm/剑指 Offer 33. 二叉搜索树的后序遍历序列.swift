//
//  剑指 Offer 33. 二叉搜索树的后序遍历序列.swift
//  leeeee
//
//  Created by liang.wang on 31/10/2022.
//

import Foundation


// 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。
class SolutionOff33: Solution {
    func submit() {
        print(verifyPostorder([1,3,2,6,5]))
        print(verifyPostorder([1,6,3,2,5]))
    }
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        // 二叉树后序遍历的最后一个肯定是根节点（左孩子值<=根的值<=右孩子的值！）
        // 先找左子树的范围，然后右子树的范围，然后二分法逐渐缩小
        process(postorder, 0, postorder.count - 1)
    }
    
    // [start, end] 范围内
    // end为根节点索引
    func process(_ arr: [Int], _ start:Int, _ end: Int) -> Bool {
        
        if start >= end {
            //遍历完成，没有发现错误，则认为有效
            return true
        }
        
        //寻找左边树的index
        var leftIndex = 0
        for i in  0...end {
            if arr[i] > arr[end] {
                //找到左子树root的索引
                leftIndex = i - 1
                break
            }
        }
        
        // 右树
        for j in leftIndex + 1...end {
            if arr[j] < arr[end] {
               return false //因为右边一定大于根节点的
            }
        }
        
        return process(arr, start, leftIndex) && //左子树
        process(arr, leftIndex + 1, end - 1) //有子树
        
    }
    
    
    
}
