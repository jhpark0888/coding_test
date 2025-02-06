let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n + 1)
nums.insert(0, at: 0)

for i in 1...n {
    var temp = 1
    for j in 1..<i {
        if nums[i] < nums[j] {
            temp = max(temp, dp[j] + 1)
        }
    }
    dp[i] = temp
}

print(dp.max()!)

// 가장 긴 감소하는 부분 수열