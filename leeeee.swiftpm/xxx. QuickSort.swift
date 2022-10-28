//
//  xxx. QuickSort.swift
//  leeeee
//
//  Created by liang.wang on 17/10/2022.
//

import Foundation

func quickSort(arr: inout [Int], low: Int, high: Int){
    
    if low >= high {
        return
    }
    
    let pi = partition(&arr, low, high);
    quickSort(arr: &arr, low: low, high: pi - 1)
    quickSort(arr: &arr, low: pi + 1, high: high)
    
    
    
}


//随机选择一个数：pivot （因为不是有序的，所以你不可能知道中位数）
//双指针，比pivot小的数都在左边，大的数在右边，返回中位数
func partition(_ a: inout [Int], _ low: Int, _ high: Int) -> Int {
  let pivot = a[high]

  var i = low
  for j in low..<high {
    if a[j] <= pivot {
      (a[i], a[j]) = (a[j], a[i])
      i += 1 // 移动指针，已确保，i前面的值都是小余pivot的
    }
//            print(i,j, a[i], a[j])
  }

  (a[i], a[high]) = (a[high], a[i])
//            print("fuck", i, a[i], a[high])
  return i
}

