import Foundation

var n = Int(readLine()!)!
var dp = Array(repeating: Int.max, count: n + 1)
dp[0] = 0

for i in 1...n {
    var temp = dp[i]
    for j in 1...Int(sqrt(Double(i))) {
        temp = min(temp, dp[i - j * j] + 1)
    }
    dp[i] = temp
}

print(dp[n])

// 제곱수의 합