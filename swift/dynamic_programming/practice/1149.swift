let n = Int(readLine()!)!
var p: [[Int]] = [[0, 0, 0]]

for _ in 0..<n {
    p.append(readLine()!.split(separator: " ").map {Int($0)!})
}

var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
dp[1][0] = p[1][0]
dp[1][1] = p[1][1]
dp[1][2] = p[1][2]

for i in 2...n {
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + p[i][0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + p[i][1]
    dp[i][2] = min(dp[i - 1][1], dp[i - 1][0]) + p[i][2]
}

print(dp[n].min()!)

// RGB거리