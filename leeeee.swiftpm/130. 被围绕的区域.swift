//
//  130. 被围绕的区域.swift
//  leeeee
//
//  Created by liang.wang on 2/11/2022.
//

import Foundation

// 这个问题跟岛屿问题很相似。
//给你一个 m x n 的矩阵 board ，由若干字符 'X' 和 'O' ，找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/surrounded-regions
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution130: Solution {
    func submit() {

    }
    func solve(_ board: inout [[Character]]) {
        
        if board.count <= 1 || board.first?.count ?? 0 <= 1 {
            return
        }
        
        
        
        //其实只需要4个border边就行。
        //先找4边的O，将它标记成临时的Y，并将它相连的部分的O也标记成Y
        for i in 0...board.count - 1 {
            for j in 0...(board.first?.count ?? 0 - 1) {
                if !isBoarder(board, i, j) {
                    continue
                }
                
                if board[i][j] == Character("O") {
                    board[i][j] = Character("Y")
                    dps(&board, i, j)
                }
            }
        }
        
        for i in 0...board.count - 1 {
            for j in 0...(board.first?.count ?? 0 - 1) {
                
                // O变成X
                if board[i][j] == Character("O") {
                    board[i][j] = Character("X")
        
                }
                
                //还原Y成为O
                if board[i][j] == Character("Y") {
                    board[i][j] = Character("O")
        
                }
            }
        }
        
    }
    
    // 先把4边中的‘O'涂成一个特殊的字母Y
    //当前(x,y)是“O”，并且位于4条边。  dp[x][y] 表示将(x,y)周围连接的区域 'O' 用 'Y' 填充。
    func dps(_ board: inout [[Character]], _ x: Int, _ y: Int) {
        
        let width = board.count
        let height = board.first?.count ?? 0
    
        
        if x + 1 < width - 1 {
            dps(&board, x + 1, y)
        }
        if x - 1 >= 0 {
            dps(&board, x - 1, y)
        }
        
        if y + 1 < height - 1 {
            dps(&board, x, y + 1)
        }
        
        if y - 1 >= 0 {
            dps(&board, x, y - 1)
        }
        
        
        
        
    }
    
    func isBoarder(_ board: [[Character]], _ x: Int, _ y: Int) -> Bool {
        
        if board.count <= 1 || board.first?.count ?? 0 <= 1 {
            return true
        }
        
        
        if x == 0 || y == 0 || x == board.count - 1 || y == board.first?.count ?? 0 {
            return true
        }
        
        return false
    }
}
