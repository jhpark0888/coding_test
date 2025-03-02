let d = [(1, 2), (2, 1), (-1, 2), (2, -1), (1, -2), (-2, 1), (-1, -2), (-2, -1)]

for _ in 0..<(Int(readLine()!)!) {
    let i = Int(readLine()!)!
    let cur = readLine()!.split(separator: " ").map { Int($0)! }
    let (cx, cy) = (cur[0], cur[1])
    let target = readLine()!.split(separator: " ").map { Int($0)! }
    let (tx, ty) = (target[0], target[1])

    var queue = [(cx, cy, 0)]
    var isVisited = Array(repeating: Array(repeating: false, count: i), count: i)

    while !queue.isEmpty {
        let (x, y, count) = queue.removeFirst()

        if x == tx && y == ty { 
            print(count)
            break    
        }

        for (dx, dy) in d {
            let px = x + dx
            let py = y + dy
            guard px >= 0 && px < i && py >= 0 && py < i else { continue }
            if isVisited[py][px] { continue }

            isVisited[py][px] = true
            queue.append((px, py, count + 1))
        } 
    }
}

// 나이트의 이동