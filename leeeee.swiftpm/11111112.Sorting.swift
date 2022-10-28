//
//  11111112.Quick Sort.swift
//  leeeee
//
//  Created by liang.wang on 20/10/2022.
//

import Foundation


//Best case             Average case             Wrost case
// --------------------------------------------------------------
//   O(logn)              O(logn)                   O(n)
func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot}
    let greater = a.filter { $0 > pivot}
    
    return quickSort(less) + equal + quickSort(greater)
}

// 归并排序
func nerSort(_ a: [Int]) -> [Int] {
    guard a.count > 1 else { return a }
    
    if a.count == 2 {
        return a[0] > a[1] ? [a[1], a[0]] : a
    }
    
    let mid = a[a.count/2]
    
    let left = nerSort(Array(a[0..<mid]))
    let right = nerSort(Array(a[mid + 1..<a.count]))
    return merge(left, mid, right)
    
    
    func merge(_ left:[Int], _ mid: Int, _ right: [Int]) -> [Int] {
        // TODO
        return []
    }
    
    
}


