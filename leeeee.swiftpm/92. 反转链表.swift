//
//  92. 反转链表.swift
//  leeeee
//
//  Created by liang.wang on 25/10/2022.
//

import Foundation

// 给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right
class Solution92: Solution {
    var successor: ListNode?
    
    func submit() {
        let result = reverse(linkedListDemoLong, 2,6)
        result?.print()
    }
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        return nil
    }
}

extension Solution92 {
    
    // 定义：输入一个单链表头结点，将该链表反转，返回新的头结点
    func reverse(_ head: ListNode?) -> ListNode? {
        let p = head
        
        //结束条件
        if p == nil || p?.next == nil {
            return p
        }
        
        //递归
        let last = reverse(p?.next)
        
        // 连接
        p?.next?.next = head // 调转方向
        p?.next = nil // 第一个指向的是nil
        
        return last
    }
    
    //// 反转以 head 为起点的 n 个节点，返回新的头结点

    func reverse(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        if n == 1 {
            successor = head?.next
            print("successor is: \(successor?.val)")
            return head
        }
        
        let last = reverse(head?.next, n-1)
        head?.next?.next = head
        
        // 刚才我们直接把 head.next 设置为 null，因为整个链表反转后原来的 head 变成了整个链表的最后一个节点。但现在 head 节点在递归反转之后不一定是最后一个节点了，所以要记录后驱 successor（第 n + 1 个节点），反转之后将 head 连接上。
        head?.next = successor
        
        return last
    }
    
    //给一个索引区间 [m, n]（索引从 1 开始），仅仅反转区间中的链表元素。
    func reverse(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        let p: ListNode? = head
        if m == 1 {
            return reverse(p, n)
        }
        
        p?.next = reverse(p?.next, m-1, n-1)
        return p
    }
}
