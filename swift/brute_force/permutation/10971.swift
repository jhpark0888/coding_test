let n = Int(readLine()!)!
var costs = [[Int]]()
for _ in 0..<n {
    costs.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var result = Int.max

func back_tracking(cost: Int, visited: [Int], depth: Int) {
    if depth == n {
        let lastCost = costs[visited.last!][visited.first!]
        if lastCost == 0 { return }
        
        result = min(result, cost + lastCost)
        return
    }

    for i in 0..<n {
        if visited.isEmpty {
            back_tracking(cost: cost, visited: [i], depth: depth + 1)
            continue
        }

        let curCost = costs[visited.last!][i]
        if !visited.contains(i) && curCost != 0 {
            back_tracking(cost: cost + curCost, visited: visited + [i], depth: depth + 1)
        }
    }
}

back_tracking(cost: 0, visited: [], depth: 0)
print(result)

// 외판원 순회2