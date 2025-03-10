let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
var maze = [[Int]]()

for _ in 0..<n {
    maze.append(Array(readLine()!).map { Int(String($0))! } )
}

var queue = [(0, 0, 0)]
var minCount = Array(repeating: Array(repeating: Int.max, count: m), count: n)
minCount[0][0] = 0

while !queue.isEmpty {
    let (x, y, count) = queue.removeFirst()

    if x == m - 1 && y == n - 1 {
        print(minCount[n - 1][m - 1])
        break
    }

    for (dx, dy) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
        let (nx, ny) = (x + dx, y + dy)

        guard nx >= 0 && nx < m && ny >= 0 && ny < n else { continue }

        let wall = maze[ny][nx]
        if minCount[ny][nx] <= count + wall { continue }

        minCount[ny][nx] = count + wall

        if wall == 1 {
            queue.append((nx, ny, count + wall))
        } else {
            queue.insert((nx, ny, count), at: 0)
        }
    }
}

// 알고스팟