import Foundation

let s = readLine()!.split(separator: " ").map { Int($0)! }[1]
let distanceList = readLine()!.split(separator: " ").map { abs(s - Int($0)!)  }
var result = distanceList.min()!

for i in 0..<distanceList.count {
    result = getGCD(b: distanceList[i], r: result)
}
print(result)

func getGCD(b: Int, r: Int) -> Int {
    if b % r == 0 { return r }
    return getGCD(b: r, r: b % r)
}
// 숨바꼭질 6