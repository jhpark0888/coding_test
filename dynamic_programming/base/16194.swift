let n = Int(readLine()!)!
var dp = readLine()!.split(separator: " ").map { Int($0)! }
dp.insert(0, at: 0)

for i in 2...n {
    var minValue = Int.max
    for j in stride(from: i, through: i / 2, by: -1) {
        minValue = min(minValue, dp[j] + dp[i - j])
    }
    dp[i] = minValue
}

print(dp[n])

// 카드 구매하기2