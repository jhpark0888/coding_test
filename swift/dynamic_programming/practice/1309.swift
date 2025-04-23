let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
let mod = 9901

for i in 1...n {
    if i == 1 {
        // 비어두는 경우의 수
        dp[1][0] = 1
        // 왼쪽에 배치하는 경우의 수
        dp[1][1] = 1
        // 오른쪽에 배치하는 경우의 수
        dp[1][2] = 1
        continue
    }

    dp[i][0] = (dp[i - 1][0] + dp[i - 1][1] + dp[i - 1][2]) % mod 
    dp[i][1] = (dp[i - 1][0] + dp[i - 1][2]) % mod 
    dp[i][2] = (dp[i - 1][0] + dp[i - 1][1]) % mod 
}

print( (dp[n].reduce(0) { $0 + $1 }) % mod )

// 점화식 사용
// let n = Int(readLine()!)!
// var dp = Array(repeating: 0, count: n + 1)
// let mod = 9901

// for i in 1...n {
//     if i == 1 {
//         dp[0] = 1
//         dp[1] = 3
//         continue
//     }

//     dp[i] = (dp[i - 1] * 2 + dp[i - 2]) % mod 
// }

// print(dp[n])

// 동물원