func dp() -> Int {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nk[0]
    let k = nk[1]

    guard n < k else { return n - k }    

    var dp = Array(repeating: 0, count: k + 1)

    for i in 0..<n {
        dp[i] = n - i
    }

    for i in (n + 1)...k {
        if i % 2 == 0 {
            dp[i] = min(dp[i / 2], dp[i - 1] + 1)
        } else {
            dp[i] = min(dp[(i + 1) / 2] + 1, dp[i - 1] + 1)
        }
    }

    return dp[k]
}

print(dp())

// 숨바꼭질3