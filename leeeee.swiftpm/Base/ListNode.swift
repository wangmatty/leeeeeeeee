//
//  File.swift
//  
//
//  Created by liang.wang on 22/10/2022.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func print() {
        var head: ListNode? = self
        while head != nil {
            Swift.print(head!.val)
            head = head?.next
        }
    }
}

var linkedListCycleDemo: ListNode {
    let head = ListNode(0)
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
   
    node4.next = node2
    
    return head
}


var linkedListDemo: ListNode {
    let head = ListNode(0)
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    return head
}

var linkedListDemo2: ListNode {
    let head = ListNode(1)
    let node1 = ListNode(2)
    let node2 = ListNode(4)
    head.next = node1
    node1.next = node2
    return head
}

var linkedListDemo3: ListNode {
    let head = ListNode(1)
    let node1 = ListNode(3)
    let node2 = ListNode(4)
    head.next = node1
    node1.next = node2
    return head
}

var linkedListDemoLong: ListNode {
    let head = ListNode(0)
    let node1 = ListNode(3)
    let node2 = ListNode(6)
    let node3 = ListNode(9)
    let node4 = ListNode(12)
    let node5 = ListNode(15)
    let node6 = ListNode(20)
    let node7 = ListNode(21)
    let node8 = ListNode(30)
    let node9 = ListNode(40)
    let node10 = ListNode(50)
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    node6.next = node7
    node7.next = node8
    node8.next = node9
    node9.next = node10
    return head
}
