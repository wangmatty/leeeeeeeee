//
//  剑指 Offer 22. 链表中倒数第k个节点.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

// 输入一个链表，输出该链表中倒数第k个节点。只允许一次便利
class Solution22: Solution {
    
    func submit() {
        let result = getKthFromEnd(linkedListDemoLong, 3)
        linkedListDemoLong.print()
        print(result?.val)
    }
    
    
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        for i in 0..<k {
            fast = fast?.next
        }
        
        if fast == nil {
            return nil
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }
}
