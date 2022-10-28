//
//  86. 分隔链表.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

// 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
class Solution86: Solution {
    
    func submit() {
        
    }
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        // 存放小于大于 x 的链表的虚拟头结点
        var dumy1:ListNode? = ListNode(-1)
        var dumy2:ListNode? = ListNode(-1)
        
        // p1, p2 指针负责生成结果链表
        var p1 = dumy1
        var p2 = dumy2
        
        var p = head
        
        while p != nil {
            if p!.val >= x {
                p2?.next = p
                p2 = p2?.next
            } else {
                p1?.next = p;
                p1 = p1?.next;
            }
            
            // 断开原链表中的每个节点的 next 指针
            var temp = p?.next;
            p?.next = nil;
            p = temp;
        }
        
        p1?.next = dumy2?.next
        
        
        return dumy1?.next
    }
}
