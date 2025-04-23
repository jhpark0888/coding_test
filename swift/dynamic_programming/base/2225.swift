let input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

for i in 1...n {
    for j in 1...k {
        if i == 1 {
            dp[1][j] = j
            continue
        }

        if j == 1 {
            dp[i][1] = 1
            continue
        }

        dp[i][j] = (dp[i][j - 1] + dp[i - 1][j]) % 1_000_000_000
    }
}

print(dp[n][k])

// 합분해