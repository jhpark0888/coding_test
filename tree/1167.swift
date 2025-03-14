let n = Int(readLine()!)!
var tree = Array(repeating: [(Int, Int)](), count: n + 1)
var isChecked = Array(repeating: false, count: n + 1)
var answer = 0

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let node = line[0]
    var index = 1

    while line[index] != -1 {
        let next = line[index]
        let weight = line[index + 1]

        tree[node].append((next, weight))
        index += 2
    }
}

func dfs(parent: Int) -> Int {
    isChecked[parent] = true
    
    var maxWeight = 0

    for (c, w) in tree[parent] {
        if isChecked[c] { continue }

        let childWeight = dfs(parent: c)
        answer = max(answer, maxWeight + w + childWeight)
        maxWeight = max(maxWeight, w + childWeight)
    }
    
    return maxWeight
}

let _ = dfs(parent: 1)
print(answer)

// 트리의 지름