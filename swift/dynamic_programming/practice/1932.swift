let n = Int(readLine()!)!
var dp: [[Int]] = [[]]

for _ in 0..<n {
    dp.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1...n {
    if i == 1 { continue }

    for j in 0..<i {
        if j == 0 {
            dp[i][0] += dp[i - 1][0]
            continue
        }

        if j == i - 1 {
            dp[i][i - 1] += dp[i - 1][i - 2]
            continue
        }

        dp[i][j] += max(dp[i - 1][j - 1], dp[i - 1][j])
    }    
}

print(dp[n].max()!)

// 정수 삼각형