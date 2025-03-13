let n = Int(readLine()!)!
var tree = [Int: [Int]]()
var parents = Array(repeating: 0, count: n + 1)

for _ in 0..<(n-1) {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    tree[nodes[0], default: []].append(nodes[1])
    tree[nodes[1], default: []].append(nodes[0])
}

func dfs(parent: Int) {
    for child in tree[parent]! {
        if parents[child] != 0 { continue }
        parents[child] = parent
        dfs(parent: child)
    }
}

dfs(parent: 1)

for i in 2...n {
    print(parents[i])
}

// 트리의 부모 찾기