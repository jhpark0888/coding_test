let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var answer = 1
var cur = (x: 1, y: 1)

for (dx, dy) in [(1, 2), (1, -2), (2, 1), (2, -1), ] {
    let (nx, ny) = (cur.x + dx, cur.y + dy)

    guard nx > 0 && nx <= m && ny > 0 && ny <= n else { continue }
    cur = (nx, ny)
    answer += 1
}

if answer >= 5 {
    answer += m - cur.x
} else {
    if n > 2 {
        answer = min(4, answer + m - cur.x) 
    } else if n > 1 {
        answer = min(4, answer + (m - cur.x) / 2) 
    }
}

print(answer)

// 병든 나이트