//
//  51. N 皇后.swift
//  leeeee
//
//  Created by liang.wang on 18/11/2022.
//

import Foundation

class Solution51: Solution {
    func submit() {
        print(solveNQueens(4))
    }
    func solveNQueens(_ n: Int) -> [[[String]]] {
        var board = Array(repeating: Array(repeating: "", count: n), count: n)
        backTrack(board: &board, row: 0)
        return result
    }
    
    var result: [[[String]]] = []
    
    func backTrack(board: inout [[String]], row: Int) {
        
        // 触发结束条件
        if row == board.count {
            result.append(board)
            return
        }
        
        for col in 0..<board[0].count {
            
            // 排除不合理的选择
            if !isValid(board: &board, row: row, col: col) {
                continue
            }
            
            // 选择
            board[row][col] = "Q"
            
            backTrack(board: &board, row: row + 1)
            
            // 撤销选择
            board[row][col] = "."
        }
        
    }
    
    /* 是否可以在 board[row][col] 放置皇后？ */
    func isValid(board: inout [[String]], row: Int, col: Int) -> Bool {
        //column
        for i in 0...row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // 右上
        var i = row - 1
        var j = col + 1
        while i >= 0 && j <= (board[0].count - 1) {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        // 左上方
        i = row - 1
        j = col - 1
        while i >= 1 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        return true
    }
    
}
