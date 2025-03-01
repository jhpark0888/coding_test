let n = Int(readLine()!)!
var map = [[Int]]()
let d = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var result = [Int]()

func dfs(x: Int, y: Int, count: inout Int) {
    if map[y][x] == 0 { return }
    map[y][x] = 0
    count += 1

    for (dx, dy) in d {
        let px = x + dx
        let py = y + dy
        
        guard px >= 0 && px < n && py >= 0 && py < n else { continue }
        dfs(x: px, y: py, count: &count)
    }
}

for _ in 0..<n {
    map.append(Array(readLine()!).map { Int(String($0))!})
}

for y in 0..<n {
    for x in 0..<n {
        if map[y][x] == 0 { continue }
        var count = 0
        dfs(x: x, y: y, count: &count)
        result.append(count)
    }
}

result.sort()
print(result.count)
for c in result { print(c) }

// 단지번호붙이기