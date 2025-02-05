let n = Int(readLine()!)!
let mod = 10_007
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)

for i in 0...n {
    dp[i][0] = 1
}

for i in 1...n {
    if i == 1 {
        for j in 1...9 {
            dp[1][j] = 1
        }
        continue
    }

    for j in 1...9 {
        dp[i][j] = (dp[i - 1][j] + dp[i][j - 1]) % mod
    }
}

print((dp[n].reduce(0, +)) % mod)

// 오르막 수