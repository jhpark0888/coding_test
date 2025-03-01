let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, v) = (nmv[0], nmv[1], nmv[2])
var graph = [Int:[Int]]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let v1 = input[0]
    let v2 = input[1]
    
    graph[v1, default: []].append(v2)
    graph[v1]?.sort()
    graph[v2, default: []].append(v1)
    graph[v2]?.sort()
}

func dfs(cur: Int) {
    if isVisit.count == n { return }
    
    if !isVisit.contains(cur) {
        print(cur, terminator: " ")
        isVisit.insert(cur)
    }

    for next in graph[cur] ?? [] {
        if !isVisit.contains(next) {
            dfs(cur: next)
        }
    }
}

func bfs(cur: Int) {
    var queue = [cur]
    print(cur, terminator: " ")
    isVisit.insert(cur)

    while !queue.isEmpty {
        let curV = queue.removeFirst()
        for next in graph[curV] ?? [] {
            if !isVisit.contains(next) {
                print(next, terminator: " ")
                isVisit.insert(next)
                queue.append(next)
            }
        }
    }
    print()
    
}

var isVisit = Set<Int>()
dfs(cur: v)
print()
isVisit.removeAll()
bfs(cur: v)

// DFS와 BFS