// 다른 사람 풀이 참고
let n = Int(readLine()!)!
let maxValue = 1_000_000
var costs: [[Int]] = [[0]]
var results = [Int]()

for _ in 0..<n {
    costs.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<3 {
    var dp = costs 
    dp[n][i] = maxValue
    dp[2][i] = maxValue
    
    for j in 0..<3 {
        if i != j {
            dp[1][j] = costs[1][i] 
        }
    }

    for j in 2...n {
        dp[j][0] += min(dp[j - 1][1], dp[j - 1][2])
        dp[j][1] += min(dp[j - 1][0], dp[j - 1][2])
        dp[j][2] += min(dp[j - 1][0], dp[j - 1][1])
    }

    results.append(dp[n].min()!)
}

print(results.min()!)

// 내 풀이
// let n = Int(readLine()!)!
// var dp = Array(repeating: Array(repeating: Int.max, count: 9), count: n + 1)
// var costs: [[Int]] = [[0, 0, 0]]

// for _ in 0..<n {
//     costs.append(readLine()!.split(separator: " ").map { Int($0)! })
// }

// for i in 2...n {
//     if i == 2 {
//         // R R
//         // R G
//         // R B
//         // dp[i][0] = Int.max
//         dp[i][1] = costs[i - 1][0] + costs[i][1]
//         dp[i][2] = costs[i - 1][0] + costs[i][2]
        
//         // G R
//         // G G
//         // G B
//         dp[i][3] = costs[i - 1][1] + costs[i][0]
//         // dp[i][4] = Int.max
//         dp[i][5] = costs[i - 1][1] + costs[i][2]
        
//         // B R
//         // B G
//         // B B
//         dp[i][6] = costs[i - 1][2] + costs[i][0]
//         dp[i][7] = costs[i - 1][2] + costs[i][1]
//         // dp[i][8] = Int.max

//         continue
//     }

//     if i != n {
//         dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + costs[i][0]
//         dp[i][4] = min(dp[i - 1][3], dp[i - 1][5]) + costs[i][1]
//         dp[i][8] = min(dp[i - 1][6], dp[i - 1][7]) + costs[i][2]
//     }

//     dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + costs[i][1]
//     dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + costs[i][2]

//     dp[i][3] = min(dp[i - 1][4], dp[i - 1][5]) + costs[i][0]
//     dp[i][5] = min(dp[i - 1][3], dp[i - 1][4]) + costs[i][2]
    
//     dp[i][6] = min(dp[i - 1][7], dp[i - 1][8]) + costs[i][0]
//     dp[i][7] = min(dp[i - 1][6], dp[i - 1][8]) + costs[i][1]
// }

// print(dp[n].min()!)

// RGB거리 2