//
//  File.swift
//  
//
//  Created by liang.wang on 19/10/2022.
//

import Foundation


public class LinkedList<T> {
  fileprivate var head: Node<T>?
  private var tail: Node<T>?

  public var isEmpty: Bool {
    return head == nil
  }

  public var first: Node<T>? {
    return head
  }

  public var last: Node<T>? {
    return tail
  }

  public func append(value: T) {
    let newNode = Node(value: value)
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
  }

  public func nodeAt(index: Int) -> Node<T>? {
    if index >= 0 {
      var node = head
      var i = index
      while node != nil {
        if i == 0 { return node }
        i -= 1
        node = node!.next
      }
    }
    return nil
  }

  public func removeAll() {
    head = nil
    tail = nil
  }

  public func remove(node: Node<T>) -> T {
    let prev = node.previous
    let next = node.next

    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    next?.previous = prev

    if next == nil {
      tail = prev
    }

    node.previous = nil
    node.next = nil
    
    return node.value
  }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    var text = "["
    var node = head

    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil { text += ", " }
    }
    return text + "]"
  }
}


extension LinkedList {
    public class Node<T> {
      var value: T
      var next: Node<T>?
      weak var previous: Node<T>?

      init(value: T) {
        self.value = value
      }
    }
}

// my own extension
extension LinkedList {
    public func addFirst(value: T) {
        let newNode = Node(value: value)
        var temp = head
        newNode.next = temp
        head = newNode
    }
    
    public func removeFirst() -> Node<T>? {
        if head == nil {
            return nil
        }
        head = head?.next
        
        return head
    }
    
    public func removeLast() -> Node<T>? {
        if tail == nil {
            return nil
        }
        var temp = tail
        tail?.previous?.next = nil
        tail = tail?.previous
        
        return temp
    }
    
    public var count: Int {
        var result = 0
        var next = head
        while next != nil {
            next = next?.next
            result += 1
        }
        
        return result
    }
}


var linkedListDemoDog:LinkedList<String> {
    let dogBreeds = LinkedList<String>()
    dogBreeds.append(value: "Labrador")
    dogBreeds.append(value: "Bulldog")
    dogBreeds.append(value: "Beagle")
    dogBreeds.append(value: "Husky")
    return dogBreeds
}

var linkedListDemoNumber:LinkedList<Int> {
    let numbers = LinkedList<Int>()
    numbers.append(value: 5)
    numbers.append(value: 10)
    numbers.append(value: 15)
    return numbers
}

