let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    var temp = dp[i]
    for j in 0..<i {
        if nums[i] > nums[j] {
            temp = max(temp, dp[j] + 1)
        }
    }
    dp[i] = temp
}

print(dp.max()!)

// 가장 긴 증가하는 부분 수열