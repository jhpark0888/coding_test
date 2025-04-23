let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map { Int($0)! }
p.insert(0, at: 0)

var visited = Array(repeating: true, count: n + 1)
visited[p[n]] = false

var boundaryNum = 1

for i in stride(from: n - 1, through: 1, by: -1) {
    let num = p[i]
    visited[num] = false
    if num > p[i + 1] { 
        boundaryNum = num
        p = Array(p[1..<i])
        break
    }
}

if boundaryNum > 1 {
    for num in stride(from: boundaryNum - 1, through: 1, by: -1) {
        if visited[num] { continue }
        p.append(num)
        visited[num] = true
        break
    }

    for num in stride(from: n, through: 1, by: -1) {
        if visited[num] { continue }
        p.append(num)
    }

    print(p.map { String($0) }.joined(separator: " "))
} else {
    print(-1)
}

// 이전 순열