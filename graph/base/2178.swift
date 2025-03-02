let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var maze = [[Int]]()
for _ in 0..<n {
    maze.append(Array(readLine()!).map { Int(String($0))! })
}

let d = [(1, 0), (0, 1), (-1, 0),  (0, -1)]
var isVisited = maze.map { $0.map { _ in false }}
var queue = [(0, 0, 1)]
isVisited[0][0] = true

func bfs() -> Int {
    while !queue.isEmpty {
        let (x, y, count) = queue.removeFirst()

        if y == n - 1 && x == m - 1 { return count }

        for (dx, dy) in d {
            let px = dx + x
            let py = dy + y

            guard px >= 0 && px < m && py >= 0 && py < n else { continue }
            if maze[py][px] == 0 { continue }
            if isVisited[py][px] { continue }

            isVisited[py][px] = true
            queue.append((px, py, count + 1))
        }
    }
    return -1
}

print(bfs())

// 미로 탐색