//
//  Data Structure + Demo.swift
//  刷题啦
//
//  Created by liang.wang on 10/10/2022.
//

import Foundation


// 问题：括号匹配问题
func checkBraces(_ str: String) {
    var stack = Stack<String>()
    let lefts = ["{", "(", "[", "<"]
    let rights = ["}", ")", "]", ">"]
    
    for item in str {
        if lefts.contains(String(item)) {
            stack.push(String(item))
        } else if rights.contains(String(item)) {
            stack.pop()
        }
    }
    
    print("括号匹配吗 \(stack.count == 0)")
}

// 问题： 数组去重，但是同时必须字典序最小
func removeDuplicateAndKeepMinimum(_ arr: [Int]) {
    var stack = Stack<Int>()
    
    //计算重复的次数
    var hash:[Int: Int] = [:]
    for item in arr {
        if hash[item] == nil {
            hash[item] = 0
        }
        hash[item] = hash[item]! + 1
    }
    
    var inStackHash:[Int: Bool] = [:]
    
    for item in arr {
        
        if inStackHash[item] != true {
            continue
        }
        
        if !stack.isEmpty && stack.top ?? Int.min > item {
            if hash[stack.top ?? 0] == 0 {
                
            }
        }
        
        stack.push(item)
        inStackHash[item] = true
    }
    
    print(stack)
}


