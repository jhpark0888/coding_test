var stairsCount = Int(readLine() ?? "")

var dp: [[Int]] =  Array(repeating: Array(repeating: 0, count: 3), count: stairsCount!)

for index in 0..<stairsCount! {
    let stairsScore = Int(readLine() ?? "") ?? 0
    // 첫 계단
    if index == 0 {
        dp[index][0] = 0
        dp[index][1] = stairsScore
        dp[index][2] = stairsScore
        continue
    }

    // 0: 이번 계단은 밟지 않는 경우
    // 1: 저번 계단은 밟지 않고 이번 계단을 밟는 경우
    // 2: 저번 계단과 이번 계단을 밟는 경우
    dp[index][0] = max(dp[index-1][2], dp[index-1][1]) 
    dp[index][1] = dp[index-1][0] + stairsScore
    dp[index][2] = dp[index-1][1] + stairsScore
}

// 마지막 계단 안 밟은 경우 제외
dp[stairsCount! - 1][0] = 0

print(dp[stairsCount! - 1].max() ?? 0)
