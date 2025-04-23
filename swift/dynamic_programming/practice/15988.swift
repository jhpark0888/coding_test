var nums: [Int] = []
for _ in 0..<Int(readLine()!)! {
    nums.append(Int(readLine()!)!)
}

let maxNum = nums.max()!
var dp = Array(repeating: 0, count: maxNum + 1)
dp[1] = 1
dp[2] = 2
dp[3] = 4

if maxNum > 4 {
    for i in 4...maxNum {
        dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1_000_000_009
    }
}

for n in nums {
    print(dp[n])
}

// 1, 2, 3 더하기 3