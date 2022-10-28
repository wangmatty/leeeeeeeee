//
//  File.swift
//  
//
//  Created by liang.wang on 3/10/2022.
//

import Foundation

struct Queue<T> {
  var elements: [T] = []

  mutating func enqueue(_ value: T) {
    elements.append(value)
  }

  mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeLast()
  }

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
    
    var isEmpty: Bool {
        head == nil
    }
    
    var count: Int {
        elements.count
    }
    
}
