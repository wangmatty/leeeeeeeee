import UIKit

var greeting = "Hello, playground"


func encode(s: String) -> String {
    
    var counts: [UInt8] = Array(repeating: 0, count: 26)
    
    for item in s {
        let val = (item.asciiValue ?? 0) - (Character("a").asciiValue ?? 0)
        counts[Int(val)] += 1
    }
    
    return String(describing: counts)
}

encode(s: "abc")
encode(s: "bca")
encode(s: "cba")
