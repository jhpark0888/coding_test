let K = Int(readLine()!)!

func bfs(start: Int, colors: inout [Int], graph: inout [[Int]]) -> Bool {
    var queue = [start]
    colors[start] = 1

    while !queue.isEmpty {
        let node = queue.removeFirst()
        for i in graph[node] {
            if colors[i] == 0 {
                colors[i] = -colors[node]
                queue.append(i)
            } else if colors[node] == colors[i] {
                return false
            }
        }
    }

    return true
}

for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map { Int($0)! }
    let (V, E) = (VE[0], VE[1])
    var graph = Array(repeating: [Int](), count: V + 1)
    var answer = "YES"

    for _ in 0..<E {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, v) = (uv[0], uv[1])

        graph[u].append(v)
        graph[v].append(u)
    }

    var colors = Array(repeating: 0, count: V + 1)

    for i in 1...V {
        if colors[i] != 0 { continue }

        if !bfs(start: i, colors: &colors, graph: &graph) {
            answer = "NO"
            break
        }
    }

    print(answer)
}

// 이분 그래프