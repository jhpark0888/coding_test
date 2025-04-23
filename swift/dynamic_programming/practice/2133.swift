let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)

for i in stride(from: 2, through: n, by: 2) {
    if i == 2 { 
        dp[0] = 1
        dp[2] = 3
        continue
    }

    dp[i] += dp[i - 2] * 3
    for j in stride(from: i - 4, through: 0, by: -2) {
        dp[i] += dp[j] * 2
    }
}

print(dp[n])

// 타일 채우기