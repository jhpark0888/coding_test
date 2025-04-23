// 내 풀이
import Foundation

var n = Int(readLine()!)!
var result = 0
var digits = 1
var temp = n

while temp > 0 {
    temp /= 10
    if temp > 0 {
        result += Int(pow(10, Double(digits - 1))) * 9 * digits
        digits += 1
    } else {
        result += (n - Int(pow(10, Double(digits - 1))) + 1) * digits
    }
} 

print(result)

// 다른 사람 풀이
// let n = Int(readLine()!)!
// var sum = 0
// var i = 1

// while i <= n {
//     sum += n - i + 1
//     i *= 10
// }

// print(sum)

// 수 이어 쓰기 1