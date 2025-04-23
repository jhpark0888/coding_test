import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = Array(repeating: [Int](), count: n)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])

    graph[a].append(b)
    graph[b].append(a)
}

func dfs(index: Int, isVisited: inout [Bool], depth: Int) {
    if depth == 5 { 
        print(1)
        exit(0) 
    }

    for i in graph[index] {
        if !isVisited[i] {
            isVisited[i] = true
            dfs(index: i, isVisited: &isVisited, depth: depth + 1)
            isVisited[i] = false
        }
    }
}

for i in 0..<n {
    var isVisited = Array(repeating: false, count: n)
    dfs(index: i, isVisited: &isVisited, depth: 0)
}

print(0)

// ABCDE