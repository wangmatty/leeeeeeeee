//
//  Sorting + Demo.swift
//  刷题啦
//
//  Created by liang.wang on 10/10/2022.
//

import Foundation

func quickSort(arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    
    let mid = arr.count/2
    var left: [Int] = []
    var right: [Int] = []
    for index in 0..<arr.count {
        if index == mid {
            continue
        }
        
        if arr[mid] > arr[index] {
            left.append(arr[index])
        } else {
            right.append(arr[index])
        }
    }
    
    let a = quickSort(arr: left)
    let b = quickSort(arr: right)
    
    return a + [arr[mid]] +  b
}
