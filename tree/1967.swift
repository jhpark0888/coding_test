let n = Int(readLine()!)!
var tree = Array(repeating: [(Int, Int)](), count: n + 1)
var answer = 0

for _ in 0..<(n - 1) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }

    tree[line[0]].append((line[1], line[2]))
}

func dfs(parent: Int) -> Int {
    var maxWeight = 0

    for (c, w) in tree[parent] {
        let childWeight = dfs(parent: c)
        answer = max(answer, maxWeight + w + childWeight)
        maxWeight = max(maxWeight, w + childWeight)

    }
    
    return maxWeight
}

let _ = dfs(parent: 1)
print(answer)

// 트리의 지름