for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var points: [[Int]] = []
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)

    for i in 0...1 {
        points.append(readLine()!.split(separator: " ").map { Int($0)! }) 
        points[i].insert(0, at: 0) 
    }

    for i in 1...n {
        dp[i][0] = max(dp[i - 1][0], dp[i - 1][1], dp[i - 1][2])
        dp[i][1] = max(dp[i - 1][0], dp[i - 1][2]) + points[0][i]
        dp[i][2] = max(dp[i - 1][0], dp[i - 1][1]) + points[1][i]
    }

    print(dp[n].max()!)
}

// 스티커