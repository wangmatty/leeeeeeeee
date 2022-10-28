//
//  11111111.Snake game.swift
//  leeeee
//
//  Created by liang.wang on 19/10/2022.
//

import Foundation

// 贪吃蛇的问题（游戏设计，非leetcode），食物每次只出现一次。
class SnakeName {
    
    //记录蛇身的位置
    var snake = LinkedList<Int>()
    
    // 记录蛇身位置的集合，便于快速判断是否咬到了自己
    var set: [Int: Bool] = [:]
    
    // 顺序记录食物， 链表的末尾是当前出现的食物
    var food = LinkedList<Int>()
    
    // m 行， n列的格子
    var n: Int
    var m: Int
    
    var alive = true
    
    init(width: Int, height: Int, foods: [(Int, Int)]) {
        self.n = width
        self.m = height
        
        snake.append(value: encode(x: 0, y: 0))  // 蛇头初始化在 (0, 0) 点
        set[encode(x: 0, y: 0)] = true
        for (x, y) in foods {
            self.food.append(value: encode(x: x, y: y))
        }
    }
    
    
    func move(direction: Direction) -> Int {
        if alive == false {
            return -1
        }
        
        var head = snake.first!.value //蛇头
        //解码蛇头的坐标
        var (x, y) = decode(val: head)
        switch direction {
        case .upper:
            x -= 1
        case .left:
            y -= 1
        case .right:
            y += 1
        case .down:
            x += 1
        }
        
        var newPosition = encode(x: x, y: y)
        
        if x < 0 || x == m || y < 0 || y == n {
            alive = false
            return -1
        }
        
        //前进一位
        snake.addFirst(value: newPosition)
        if !food.isEmpty && food.first?.value == newPosition {
            //吃到食物，不删除尾巴
            _ = food.remove(node: food.first!)
        } else {
            //没有食物，删除掉尾巴
            let lastNode = snake.removeLast()
            if lastNode != nil {
                set[lastNode!.value] = false
            }
        }
        
        if set[newPosition] == true {
            //咬到了自己
            alive = false
            return -1
        }
        
        set[newPosition] = true
        
        // 分数是吃到食物的个数，即身体长度减一
        return snake.count - 1
    }
}


extension SnakeName {
    
// 将二维坐标编码成数字
    func encode(x: Int, y: Int) -> Int {
        return x * n + y;
    }
    
    func decode(val: Int) -> (Int, Int) {
        return (val/n, val%n)
    }
    
    
    enum Direction {
        case upper
        case left
        case right
        case down
    }
}
