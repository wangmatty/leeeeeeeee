//
//  142. 环形链表.swift
//  leeeee
//
//  Created by liang.wang on 25/10/2022.
//

import Foundation

class Solution142: Solution {
    
    func submit() {
        
        let result = detectCycle(linkedListCycleDemo)
        print(result?.val)
        
        
    }
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var slow = head
        var fast = head
        
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next //快的先走，而不是慢的先走，否则慢的很快就会被慢的追上
            
            if slow?.val == fast?.val {
                return slow
            }
        }
        
        return nil
    }
    
}
