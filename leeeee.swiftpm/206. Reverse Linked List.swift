//
//  206. Reverse Linked List.swift
//  leeeee
//
//  Created by liang.wang on 12/10/2022.
//

import Foundation

class Solution206 {
    
    func submit() {
        let result = reverseList(linkedListDemo)
        result?.print()
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        if head == nil  || head?.next == nil{
            return head
        }
       
        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
}
