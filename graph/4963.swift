func dfs(w: Int, h: Int, y: Int, x: Int, isVisited: inout [[Bool]], map: [[Int]]) {
    if isVisited[y][x] || map[y][x] == 0 { return }
    isVisited[y][x] = true

    for py in (y - 1)...(y + 1) {
        if py < 0 { continue }
        for px in (x - 1)...(x + 1) {
            if px < 0 { continue }
            if py == y && px == x { continue }
            if py >= h || px >= w { continue }

            dfs(w: w, h: h, y: py, x: px, isVisited: &isVisited, map: map)
        }
    }
}

func getLandCount(w: Int, h: Int) -> Int {
    var map = [[Int]]()
    var count = 0

    for _ in 0..<h {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    var isVisited = Array(map.map { Array($0.map { _ in false }) })

    for i in 0..<h {
        for j in 0..<w {
            if isVisited[i][j] || map[i][j] == 0 { continue }
            dfs(w: w, h: h, y: i, x: j, isVisited: &isVisited, map: map)
            count += 1
        }
    }

    return count
}

while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, h) = (wh[0], wh[1])

    if w == 0 && h == 0 { break }

    print(getLandCount(w: w, h: h))
}

// 섬의 개수