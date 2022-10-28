//
//  21. 合并两个有序链表.swift
//  leeeee
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

class Solution21: Solution {
    func submit() {
        let result = mergeTwoLists(linkedListDemo2, linkedListDemo3)
        result?.print()
    }
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var p1 = list1
        var p2 = list2
        var dummy: ListNode? = ListNode(-1)
        var dummyHead = dummy
        
        while p1 != nil && p2 != nil {
            if p1!.val > p2!.val {
                dummy?.next = p2
                p2 = p2?.next
            } else {
                dummy?.next = p1
                p1 = p1?.next
            }
            dummy = dummy?.next
        }
        
        if p1 != nil {
            dummy?.next = p1
        }
        
        if p2 != nil {
            dummy?.next = p2
        }
        
        return dummyHead?.next
    }
}
