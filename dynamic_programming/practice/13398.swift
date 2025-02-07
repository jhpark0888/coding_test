let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Array(repeating: -1000, count: n + 1), count: 2)
nums.insert(-1000, at: 0)

for i in 1...n {
    let num = nums[i]

    dp[0][i] = max(num, dp[0][i - 1] + num)
    dp[1][i] = max(dp[0][i - 1], dp[1][i - 1] + num)
}

print(max(dp[0].max()!, dp[1].max()!))

// 연속합 2