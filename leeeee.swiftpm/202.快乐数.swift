// 一个“快乐数”定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，
// 也可能是无限循环但始终变不到 1。如果可以变为 1，那么这个数就是快乐数。
// “循环”这是关键，说明有重复的


class Solution202: Solution {
  func submit() {
  }
  func isHappy(_ n: Int) -> Bool {
      var result = 0

      var hash:[String: Bool] = [:]

      var str = String(n))
      hash[str] = true

      while true {
          for (index,value) in str.enumerated() {
              result = result + value * value
          }
          str = String(result)

          if hash[str] == true {
              return false
          } else {
              hash[str] = true
          }
      }

      return true
  }
}
