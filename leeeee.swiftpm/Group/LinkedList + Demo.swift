//
//  LinkedList + Demo.swift
//  刷题啦
//
//  Created by LIANG WANG on 8/10/2022.
//

import Foundation

// 反转整个链表方法1
func reverseLinkedList(head: ListNode) -> ListNode? {
    var pre: ListNode?
    var cur: ListNode?
    var next: ListNode?
    cur = head
    while cur != nil {
        next = cur?.next
        
        cur?.next = pre
        
        pre = cur
        cur = next
    }
    
    return pre
}

// 反转整个链表方法2:
func reverseLinkedList2(head: ListNode?) -> ListNode? {
    
    if head == nil || head?.next == nil {
        return head
    }
    
    let last = reverseLinkedList2(head: head?.next)
    head?.next?.next = head
    head?.next = nil
    return last
}

// 反转以 head 为起点的 n 个节点，返回新的头结点
var successor: ListNode?; // 后驱节点
func reverseLinkedList(head: ListNode?, n: Int) -> ListNode? {
    
    if n == 1 {
        successor = head?.next
        return head
    }
    
    let last = reverseLinkedList(head: head?.next, n: n - 1)
    head?.next?.next = head
    head?.next = successor
    return last
}

// 反转链表的一部分, 给一个索引区间 [m, n]（索引从 1 开始），仅仅反转区间中的链表元素。
func reverseLinkedList(head: ListNode?, m: Int, n: Int) -> ListNode? {
    if m == 1 {
        return reverseLinkedList(head: head, n: n)
    } else {
        head?.next = reverseLinkedList(head: head, m: m-1, n: n-1)
        return head
    }
}
