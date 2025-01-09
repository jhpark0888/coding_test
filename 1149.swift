var input = Int(readLine() ?? "")

if let houseCount = input {
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: houseCount)

    for i in 0..<houseCount {
        let costs = readLine() ?? ""

        let r = Int(costs.split(separator: " ")[0]) ?? 0
        let g = Int(costs.split(separator: " ")[1]) ?? 0
        let b = Int(costs.split(separator: " ")[2]) ?? 0

        if i == 0 {
            dp[i][0] = r
            dp[i][1] = g
            dp[i][2] = b
            continue
        }

        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + r
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + g
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + b
    }

    print(dp[houseCount - 1].min() ?? 0)
}