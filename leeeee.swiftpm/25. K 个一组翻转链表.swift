//
//  25. K 个一组翻转链表.swift
//  leeeee
//
//  Created by liang.wang on 25/10/2022.
//

import Foundation


// 答案还未验证过：
// 参考： https://labuladong.github.io/algo/2/19/20/
class Solution25: Solution {
    func submit() {
        let res = reverseKGroup(linkedListDemo, 3)
        res?.print()
    }
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if head == nil {return nil}
            // 区间 [a, b) 包含 k 个待反转元素
        var a: ListNode?
        var b: ListNode?
            a = b
            b = head
        
        for i in 0..<k {
                // 不足 k 个，不需要反转，base case
            if (b == nil) {return head};
            b = b?.next
        }
            // 反转前 k 个元素
            let newHead = reverse(a, b);
            // 递归反转后续链表并连接起来
            a?.next = reverseKGroup(b, k);
            return newHead;
    }
    
    /** 反转区间 [a, b) 的元素，注意是左闭右开 */
    func reverse(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur: ListNode?
        var nxt: ListNode?
        pre = nil; cur = a; nxt = a;
        
        // while 终止的条件改一下就行了
        while cur?.val != b?.val {
            nxt = cur?.next;
            cur?.next = pre;
            pre = cur;
            cur = nxt;
        }
        // 返回反转后的头结点
        return pre;
    }
}
