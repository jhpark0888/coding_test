let n = Int(readLine()!)!
var dp = readLine()!.split(separator: " ").map { Int($0)! }
dp.insert(0, at: 0)

for i in 2...n {
    var maxValue = 0
    for j in stride(from: i, through: i / 2, by: -1) {
        maxValue = max(maxValue, dp[j] + dp[i - j])
    }
    dp[i] = maxValue
}

print(dp[n])

// 카드 구매하기