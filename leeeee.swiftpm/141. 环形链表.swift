//
//  141. 环形链表.swift
//  leeeee
//
//  Created by liang.wang on 23/10/2022.
//

import Foundation

// 给你一个链表的头节点 head ，判断链表中是否有环。
class Solution141: Solution {
    func submit() {
    }
    func hasCycle(_ head: ListNode?) -> Bool {
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil && slow != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow?.val == fast?.val { //为了简单期间，否则需要ListNode实现Equal协议
                return true
            }
        }
        
        return false
    }
}
