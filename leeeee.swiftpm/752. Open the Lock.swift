//
//  752. Open the Lock.swift
//  leeeee
//
//  Created by liang.wang on 12/10/2022.
//

import Foundation


class Solution752 {
    
    func submit() {
        print(openLock(["0201","0101","0102","1212","2002"], "0202"))
//        print(openLock(["8888"], "0009"))
    }
    
    
    func openLock(_ deadends: [String], _ target: String) -> Int {
        
        var visisted: [String: Bool] = [:]
        var q = Queue<String>()
        var steps: [[String]] = []
        
        q.enqueue("0000")
        visisted["0000"] = true
        
        while !q.isEmpty {
            let count = q.count
            var levelSections: [String] = [] // 当前level做的选择, 从结果输出可以看到，这种BFS的空间要求是比较高的，因为每行的最多可能是2^n (n是树的高度）
            
            for _ in 0 ..< count {
                levelSections.append(q.head!)
                let cur = q.dequeue()!
                
                if deadends.contains(cur) {
                    continue
                }
                if cur == target {
                    print(steps)
                    return steps.count
                }
                
                // 每走一步有八种可能（向上面，下面各种）
                for j in 0..<4 {
                    let up = plusOne(s: cur, j: j)
                    if visisted[up] != true {
                        q.enqueue(up)
                        visisted[up] = true
                    }
                    
                    let down = minusOne(s: cur, j: j)
                    if visisted[down] != true {
                        q.enqueue(down)
                        visisted[down] = true
                    }
                }
            }
            
            steps.append(levelSections)
        }
        
        return -1
    }
    
    
    // 将 s[j] 向上拨动一次
    func plusOne(s: String, j: Int) -> String {
        var str = s
        var newVal = "0"
        if str[j] == "9" {
            newVal = "0"
        } else {
            newVal = "\((Int(str[j]) ?? 0) + 1)"
        }
        str.replace(atIndex: j, newChar: Character(newVal))
        return str
    }
    
    func minusOne(s:String, j: Int) -> String {
        var str = s
        var newVal = "0"
        if str[j] == "0" {
            newVal = "9"
        } else {
            newVal = "\(Int(str[j]) ?? 0 - 1)"
        }
        str.replace(atIndex: j, newChar: Character(newVal))
        return str
    }
}
