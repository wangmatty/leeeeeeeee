//
//  876. 链表的中间结点.swift
//  leeeee
//
//  Created by liang.wang on 23/10/2022.
//

import Foundation

class Solution876: Solution {
    func submit() {
        let rst = middleNode(linkedListDemoLong)
        print(rst?.val ?? "N/A")
    }
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
        

    }
}
