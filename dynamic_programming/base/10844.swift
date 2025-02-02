let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
let mod = 1_000_000_000

for i in 1...9 {
    dp[1][i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                dp[i][0] = dp[i - 1][1]
                continue 
            }

            if j == 9 {
                dp[i][9] = dp[i - 1][8]
                continue 
            }

            dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % mod
        }
    }
}

var result = 0
for i in 0...9 {
    result += dp[n][i]
}

print(dp[n].reduce(0, +) % mod)

// 쉬운 계단 수