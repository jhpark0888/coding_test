let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n + 1)
nums.insert(0, at: 0)

for i in 1...n {
    var temp = nums[i]
    for j in 1...i {
        if nums[i] > nums[j] {
            temp = max(temp, dp[j] + nums[i] )
        }
    }
    dp[i] = temp
}

print(dp.max()!)

// 가장 큰 증가하는 부분 수열