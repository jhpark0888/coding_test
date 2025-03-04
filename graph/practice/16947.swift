let n = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: n + 1) 
var cycle = Array(repeating: false, count: n + 1) 
var isVisited = Array(repeating: false, count: n + 1) 
var result = Array(repeating: 0, count: n + 1)

for _ in 0..<n {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (uv[0], uv[1])

    graph[u].append(v)
    graph[v].append(u)
}

func findCycleDfs(node: Int, parent: Int) -> Bool {
    isVisited[node] = true

    for i in graph[node] {
        if i == parent { continue }
        
        if isVisited[i] { 
            cycle[node] = true
            cycle[i] = true
            return true
        }

        if findCycleDfs(node: i, parent: node) {
            if cycle[node] { return false }
            cycle[node] = true
            return true
        }
    }
    return false
}

func bfs(start: Int) {
    var queue = [(start, 0)]
    
    while !queue.isEmpty {
        let (node, count) = queue.removeFirst()
        for i in graph[node] {
            if cycle[i] || isVisited[i] { continue }

            isVisited[i] = true
            result[i] = count + 1
            queue.append((i, count + 1))
        }
    }
}

_ = findCycleDfs(node: 1, parent: -1)
isVisited = Array(repeating: false, count: n + 1)

for i in 1...n {
    if !cycle[i] { continue }

    isVisited[i] = true
    bfs(start: i)
}

result.removeFirst()
print(result.map { String($0) }.joined(separator: " "))

// 서울 지하철 1호선