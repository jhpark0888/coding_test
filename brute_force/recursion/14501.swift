let n = Int(readLine()!)!
var tp = [[0]]
var dp = Array(repeating: 0, count: n + 1)

for _ in 0..<n {
    tp.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 1...n {
    dp[i] = max(dp[i], dp[i - 1])
    let t = tp[i][0]
    let p = tp[i][1]
    let finishedDay = i + t - 1
    if finishedDay > n { continue }

    dp[finishedDay] = max(dp[finishedDay], dp[i - 1] + p) 
}

print(dp.max()!)

// 퇴사