//
//  File.swift
//  
//
//  Created by liang.wang on 8/10/2022.
//


// 重点提示：https://github.com/labuladong/fucking-algorithm/blob/master/%E9%AB%98%E9%A2%91%E9%9D%A2%E8%AF%95%E7%B3%BB%E5%88%97/LRU%E7%AE%97%E6%B3%95.md
// 必须用class，而不是struct
// LRUCache的基本操作： 添加最近使用，删除未久使用的，根据key获取数值，一个已经存在的升级为最近使用。



import Foundation

extension DoubleList {
    class Node: Equatable {
        static func == (lhs: Node, rhs: Node) -> Bool {
            lhs.key == rhs.key && lhs.val == rhs.val
        }
        
        var key: Int
        var val: Int
        var next: Node?
        var prev: Node?
        
        init(key: Int, val: Int) {
            self.key = key
            self.val = val
        }
    }
}

// 靠近头部是最少使用的，靠近尾部是最近使用的
class DoubleList {
    // 头尾虚节点， 他们并不表示任何的节点，而只是作为指针用。
    private var head: Node
    private var tail: Node
    
    // 链表元素数
    private var size: Int
    
    init() {
        self.head = Node(key: Int.min, val: Int.min)
        self.tail = Node(key: Int.min, val: Int.min)
        self.head.next = tail
        self.tail.prev = head
        self.size = 0
    }
    
    // 在链表尾部添加节点 x，时间 O(1)
    func addLast(_ x: Node) {
        x.prev = tail.prev
        x.next = tail
        tail.prev?.next = x
        tail.prev = x
        size += 1
    }
    
    // 删除链表中的 x 节点（x 一定存在）
    // 由于是双链表且给的是目标 Node 节点，时间 O(1)
    func remove(_ x: Node) {
        x.prev?.next = x.next
        x.next?.prev = x.prev
        size -= 1
    }
    
    // 删除链表中第一个节点，并返回该节点，时间 O(1)
    func removeFirst() -> Node? {
        if head.next == tail {
            return nil
        }
        if let first = head.next {
            remove(first)
            return first
        }
        return nil
    }
    
    func getSize() -> Int {
        return size
    }
}

class LRUCache {
    // key -> Node(key, val)
    private var map: [Int: DoubleList.Node] = [:]
    
    private var cache: DoubleList = DoubleList()
    private var cap: Int
    
    init(cap: Int) {
        self.cap = cap
    }
    
    /* 删除某一个 key */
    func deleteKey(key: Int) {
        if let node = map[key] {
            cache.remove(node)
            map[key] = nil
        }
    }
    
    /* 将某个 key 提升为最近使用的 */
    func makeRecently(key: Int) {
        if let node = map[key] {
            cache.remove(node)
            cache.addLast(node)
        }
    }
    
    /* 添加最近使用的元素 */
    func addRecently(key: Int, val: Int) {
        let node = DoubleList.Node(key: key, val: val)
        cache.addLast(node)
        map[key] = node
    }
    
    /* 删除最久未使用的元素 */
    func removeLeastRecently() {
        if let node = cache.removeFirst() {
            map[node.key] = nil
        }
    }
    
    
    func get(key: Int) -> Int {
        if map[key] == nil {
            return -1
        }
        makeRecently(key: key)
        return map[key]!.val
    }
    
    func put(key: Int, val: Int) {
        // 如果已经有了，则更新
        if map[key] != nil {
            deleteKey(key: key)
            addRecently(key: key, val: val)
            return
        }
        
        //如果满了，则先删除
        if cap == cache.getSize() {
            removeLeastRecently()
        }
        
        addRecently(key: key, val: val)
    }
}
