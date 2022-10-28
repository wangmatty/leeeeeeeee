//
//  2. 两数相加.swift
//  leeeee
//
//  Created by LIANG WANG on 20/10/2022.
//

import Foundation

class Solution2: Solution {
    
    func submit() {
        var l1: ListNode {
            let result = ListNode(2)
            result.next = ListNode(4)
            result.next?.next = ListNode(3)
            return result
        }
        
        var l2: ListNode {
            let result = ListNode(5)
            result.next = ListNode(6)
            result.next?.next = ListNode(4)
            return result
        }
        
        addTwoNumbers(l1, l2)?.print()
    }
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil && l2 == nil {
            return nil
        }
        
        var result = ListNode()
        let head = result
        var next1 = l1
        var next2 = l2
        var forward = 0
        while next1 != nil || next2 != nil {
            let val = (next1?.val ?? 0) + (next2?.val ?? 0) + forward
            forward = val/10
            let remainder = val%10
            result.next = ListNode(remainder)
            result = result.next!
            next1 = next1?.next
            next2 = next2?.next
            
        }
        
        return head.next
    }
}
