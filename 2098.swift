let n = Int(readLine()!)!

var w: [[Int]] = []
var dp = Array(repeating: Array(repeating: Int.max, count: n), count: n)

for _ in 0..<n {
    let costs = readLine()!.split(separator: " ").map { Int($0)! }
    w.append(costs)
}


for i in 0..<n {
    for j in 0..<n {
        if i == j { continue }
        // dp[i][j] =  
    }
}

/// 풀이 못함
