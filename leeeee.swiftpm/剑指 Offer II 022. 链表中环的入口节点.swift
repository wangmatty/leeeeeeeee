//
//  剑指 Offer II 022. 链表中环的入口节点.swift
//  leeeee
//
//  Created by liang.wang on 25/10/2022.
//

import Foundation

// 给定一个链表，返回链表开始入环的第一个节点。
// 思路： 快慢指针，当相遇时，慢走路为K，快走路为2K。 K为环的整数倍。
// 所以，只要我们把快慢指针中的任一个重新指向 head，然后两个指针同速前进，k - m 步后一定会相遇，相遇之处就是环的起点了。
class SolutionOff022: Solution {
    func submit() {
    }
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var slow = head
        var fast = head
        
        var meetPoint: ListNode?
        
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast?.val == slow?.val {
                meetPoint = slow
                break
            }
        }
        
        if meetPoint != nil {
            fast = head // fast指向head，而slow继续在环中
            
            // 具体详解： https://labuladong.github.io/algo/2/19/18/
            while slow != nil && fast != nil {
                slow = slow?.next
                fast = fast?.next // 同一速度
                
                if slow?.val == fast?.val {
                    return fast
                }
            }
            
        }
        
        
        return nil
    }
}
