//
//  File.swift
//  
//
//  Created by liang.wang on 10/10/2022.
//

import Foundation

// peak/dequeue的都是永远数值最小的（最小堆）

struct PriorityQueue {
    private var heap: MinHeap
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        heap.count
    }
    
    func peak() -> Int? {
        heap.peek()
    }
    
    mutating func enqueue(_ element: Int) {
        heap.add(element)
    }
    
    mutating func dequeue() -> Int? {
        return heap.poll()
    }
    
}
