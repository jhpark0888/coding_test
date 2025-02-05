let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 6), count: n + 1)

for i in 1...n {
    let amount = Int(readLine()!)!

    // 안 마시는 경우의 수
    // O O X
    dp[i][0] = dp[i - 1][4]
    // O X X
    dp[i][1] = max(dp[i - 1][0], dp[i - 1][2])
    // X O X
    dp[i][2] = max(dp[i - 1][3], dp[i - 1][5])

    // 마시는 경우의 수
    // O X O
    dp[i][3] = max(dp[i - 1][0], dp[i - 1][2]) + amount
    // X O O
    dp[i][4] = max(dp[i - 1][3], dp[i - 1][5]) + amount
    // X X O
    dp[i][5] = dp[i - 1][1] + amount
}

print(dp[n].max()!)

// 포도주 시식