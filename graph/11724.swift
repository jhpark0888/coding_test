let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph = Array(repeating: [Int](), count: n + 1)
var ans = 0
var isVisited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map{ Int($0)! }
    let (u, v) = (uv[0], uv[1])

    graph[u].append(v)
    graph[v].append(u)
}

// bfs
func bfs(start: Int) {
    if isVisited[start] { return }
    isVisited[start] = true
    var queue = [start]

    while !queue.isEmpty {
        let cur = queue.removeFirst()

        for next in graph[cur] {
            if isVisited[next] { continue }
            isVisited[next] = true
            queue.append(next)
        }
    }
    ans += 1
}

// dfs
func dfs(start: Int) {
    if isVisited[start] { return }
    var stack = [start]

    while !stack.isEmpty {
        let cur = stack.popLast()!

        for next in graph[cur] {
            if isVisited[next] { continue }
            isVisited[next] = true
            stack.append(next)
        }
    }

    ans += 1
}

for i in 1...n {
    dfs(start: i)
}

print(ans)

// 연결 요소의 개수