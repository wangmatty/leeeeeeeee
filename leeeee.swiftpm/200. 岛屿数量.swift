//
//  200. 岛屿数量.swift
//  leeeee
//
//  Created by liang.wang on 28/10/2022.
//

import Foundation

//给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
//岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。
//此外，你可以假设该网格的四条边均被水包围。
// 用 DFS 算法解决岛屿题目是最常见的，每次遇到一个岛屿中的陆地，就用 DFS 算法吧这个岛屿「淹掉」。
class Solution200: Solution{
    
    func submit() {
        let  grid = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
          ]
            .map { items in
                items.map { item in
                    return Character(item)
                }
            }
        
        print(numIslands(grid))
    }
    
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let width = grid.count
        let height = grid[0].count
        var result = 0
        for i in 0...width - 1 {
            for j in 0...height - 1 {
                if String(grid[i][j]) == "1" {
                   result += 1
                    dfs(&grid, i: i, j: j)
                }
            }
        }
        
        return result
    }
    
    // 从 (i, j) 开始（包括），将与之相邻的陆地都变成海水
    func dfs(_ grid: inout [[Character]], i: Int, j: Int) {
        let width = grid.count
        let height = grid[0].count
        
        if i < 0 ||  j < 0 || i > width - 1 || j > height - 1 {
            // 已经超出边界
            return
        }
        
        if String(grid[i][j]) == "0" {
            return
        }
        
        
        grid[i][j] = Character("0") //// 将 (i, j) 变成海水
        //上下左边变成水
        dfs(&grid, i: i + 1, j: j)
        dfs(&grid, i: i - 1, j: j)
        dfs(&grid, i: i, j: j + 1)
        dfs(&grid, i: i, j: j - 1)
    }
}
