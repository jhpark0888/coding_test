let t = Int(readLine()!)!
var nList = [Int]()
var maxN = 3
let mod = 1_000_000_009

for _ in 0..<t {
    let n = Int(readLine()!)!
    nList.append(n)
    maxN = max(maxN, n)
}

var dp = Array(repeating: Array(repeating: 0, count: 3), count: maxN + 1)
dp[1][0] = 1
dp[2][1] = 1
dp[3][0] = 1
dp[3][1] = 1
dp[3][2] = 1

for i in 4...maxN {
    // 마지막 더한 숫자가 3인 경우
    dp[i][2] = (dp[i - 3][0] + dp[i - 3][1]) % mod
    // 마지막 더한 숫자가 2인 경우
    dp[i][1] = (dp[i - 2][0] + dp[i - 2][2]) % mod
    // 마지막 더한 숫자가 1인 경우
    dp[i][0] = (dp[i - 1][1] + dp[i - 1][2]) % mod
}

for n in nList {
    print((dp[n][0] + dp[n][1] + dp[n][2]) % mod )
}

// 1, 2, 3 더하기 5