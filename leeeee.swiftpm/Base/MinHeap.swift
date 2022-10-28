//
//  File.swift
//
//
//  Created by liang.wang on 10/10/2022.
//

import Foundation

//Complexity:
//remove: log(N)
//insert: log(N)
//search: N
//peak: 1

struct MinHeap {
    var items: [Int] = [] // 数组存储
    
    // MARK: - index
    
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2*parentIndex + 2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // MARK: - Boolean Check
    
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count  //????
    }

    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }

    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    
    // MARK: - Return Item From Heap
        private func leftChild(_ index: Int) -> Int {
            return items[getLeftChildIndex(index)]
        }
        private func rightChild(_ index: Int) -> Int {
            return items[getRightChildIndex(index)]
        }
        private func parent(_ index: Int) -> Int {
            return items[getParentIndex(index)]
        }
    
    // MARK: - others
    mutating private func swap(indexOne: Int, indexTwo: Int) {
      let placeholder = items[indexOne]
      items[indexOne] = items[indexTwo]
      items[indexTwo] = placeholder
    }
}

extension MinHeap {
    public func peek() -> Int? {
      if items.count != 0 {
          return items[0]
      } else {
          return nil
      }
    }
    
    mutating public func poll() -> Int? {
      if items.count != 0 {
          let item = items[0]
          items[0] = items[items.count - 1]
          heapifyDown()
          items.removeLast()
          return item
      } else {
          return nil
      }
    }
    
    mutating public func add(_ item: Int) {
      items.append(item)
      heapifyUp()
    }
}

extension MinHeap {
    mutating private func heapifyUp() {
      var index = items.count - 1
      while hasParent(index) && parent(index) > items[index] {
          swap(indexOne: getParentIndex(index), indexTwo: index)
          index = getParentIndex(index)
      }
    }
    
    mutating private func heapifyDown() {
      var index = 0
      while hasLeftChild(index) {
          var smallerChildIndex = getLeftChildIndex(index)
          if hasRightChild(index) && rightChild(index) < leftChild(index) {
              smallerChildIndex = getRightChildIndex(index)
          }

          if items[index] < items[smallerChildIndex] {
              break
          } else {
              swap(indexOne: index, indexTwo: smallerChildIndex)
          }
          index = smallerChildIndex
      }
    }
}

var heapRoot: MinHeap {
    var myHeap = MinHeap()

    myHeap.add(2)
    myHeap.add(10)
    myHeap.add(8)
    myHeap.add(9)
    myHeap.add(7)
    myHeap.add(3)
    myHeap.add(4)
    
    return myHeap
}

extension MinHeap {
    var isEmpty: Bool {
        items.count == 0
    }
    
    var count: Int {
        items.count
    }
}
