let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let d = [(1,0), (0,1), (-1,0), (0,-1)]
var board = [[Character]]()
var answer = "No"

for _ in 0..<n {
    board.append(Array(readLine()!))
}

var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)

func dfs(target: (x: Int, y: Int, color: Character), node: (x: Int, y: Int), depth: Int) -> Bool {    
    for (dx, dy) in d {
        let (nx, ny) = (dx + node.x, dy + node.y)
        guard nx >= 0 && nx < m && ny >= 0 && ny < n else { continue }

        if target.color != board[ny][nx] { continue }
        if target.x == nx && target.y == ny && depth >= 4 { return true }
        if isVisited[ny][nx] { continue }

        isVisited[ny][nx] = true
        if dfs(target: target, node: (nx, ny), depth: depth + 1) { return true }   
        isVisited[ny][nx] = false
    }

    return false
}

for y in 0..<n {
    for x in 0..<m {
        isVisited[y][x] = true
        if dfs(target: (x, y, board[y][x]), node: (x, y), depth: 1) {
            answer = "Yes"
            break
        }
    }
    if answer == "Yes" { break }
}

print(answer)

// Two Dots