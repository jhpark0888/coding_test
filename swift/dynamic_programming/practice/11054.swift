let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

func run(list: [Int]) -> [Int] {
    var dp = Array(repeating: 1, count: n)

    for i in 0..<n {
        var temp = 1
        for j in 0..<i {
            if nums[i] > nums[j] {
                temp = max(temp, dp[j] + 1)
            }
        }
        dp[i] = temp
    }

    return dp
}

var ascentDp = run(list: nums)
nums.reverse()
var descentDp = run(list: nums)
descentDp.reverse()

for i in 0..<n {
    result = max(result, ascentDp[i] + descentDp[i])
}

print(result - 1)

// 가장 긴 바이토닉 부분 수열