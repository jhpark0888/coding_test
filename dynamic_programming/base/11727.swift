let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    if i == 1 {
        dp[1] = 1
        continue
    }
    if i == 2 {
        dp[2] = 3
        continue
    }

    dp[i] = (dp[i - 1] + dp[i - 2] * 2) % 10007
}

print(dp[n])

// 2 x n 타일링2