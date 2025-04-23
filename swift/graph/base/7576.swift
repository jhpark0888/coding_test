let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m , n) = (mn[0], mn[1])
var box = [[Int]]()
var riped = [(Int, Int)]()

let d = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var count = 0
var unRipedCount = 0

for _ in 0..<n {
    box.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        let tomato = box[i][j]

        if tomato == 1 {
            riped.append((j, i))
        } else if tomato == 0 {
            unRipedCount += 1
        }
    }
}

while !riped.isEmpty && unRipedCount > 0 {
    var newRiped = [(Int, Int)]()

    if unRipedCount > 0 {
        for (x, y) in riped {
            for (dx, dy) in d {
                let px = dx + x
                let py = dy + y

                guard px >= 0 && px < m && py >= 0 && py < n else { continue }
                if box[py][px] == -1 || box[py][px] == 1 { continue }

                box[py][px] = 1
                unRipedCount -= 1
                newRiped.append((px, py))
            }
        }
    }

    if !newRiped.isEmpty { count += 1 }
    riped = newRiped
}

print( unRipedCount != 0 ? -1 : count)

// 토마토