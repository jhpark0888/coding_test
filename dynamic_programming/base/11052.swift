let n = Int(readLine()!)!
var dp = readLine()!.split(separator: " ").map { Int($0)! }
dp.insert(0, at: 0)

for i in 2...n {
    for j in 1...(i / 2) {
        dp[i] = max(dp[i], dp[j] + dp[i - j])
    }
}

print(dp[n])

// 카드 구매하기