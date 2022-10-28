//
//  160. 相交链表.swift
//  leeeee
//
//  Created by liang.wang on 23/10/2022.
//

import Foundation

// 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
class Solution160: Solution {
    func submit() {
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

        
        var p1: ListNode? = headA
        
        var p2: ListNode? = headB
        
        if headA == nil {
            return nil
        }
        
        // 核心思想
        // 链表A： A段 + 公共段C
        // 链表B： B段 + 公共段C
        // A + C + B == B + C + A，所以相交段肯定是在这最后
        while p1?.val != p2?.val {
            if p1 == nil {
                p1 = headB
            } else {
                p1 = p1?.next
            }
            
            if p2 == nil {
                p2 = headA
            } else {
                p2 = p2?.next
            }
        }
        
        return p1
    }
    
    
    // 方法2： 将A链表的末尾指向B链表的头部，这样就构成一个环，这样在A链表上用快慢指针就可以
    func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var slow = headA
        var fast = headA
        
        while slow != nil && fast != nil {
            
            if fast?.next == nil {
                fast?.next = headB
            }
            
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow?.val == fast?.val {
                return slow
            }
        }
        
        return nil
    }
}
