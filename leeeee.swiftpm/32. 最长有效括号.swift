//
//  32. 最长有效括号.swift
//  leeeee
//
//  Created by liang.wang on 20/10/2022.
//

import Foundation

// leetcode官方解答是错误的： https://leetcode.cn/problems/longest-valid-parentheses/solution/zui-chang-you-xiao-gua-hao-by-leetcode-solution/
// 用下面的方法
class Solution32: Solution {
    func submit() {
        print(longestValidParentheses("()()"))
        print(longestValidParentheses("((()())"))
    }

    
    func longestValidParentheses(_ s: String) -> Int {
        var mm = 0
        var stack = Stack<Int>()
        var start = 0

        for index in 0 ..< s.count {
            if s[index] == "(" {
                stack.push(index)
            } else {
                if stack.isEmpty {
                    start = index + 1
                } else {
                    stack.pop()
                    if stack.isEmpty {
                        mm = max(mm, index - start + 1)
                    } else {
                        mm = max(mm, index - (stack.top ?? 0))
                    }
                }
            }
        }

        return mm
    }
}
