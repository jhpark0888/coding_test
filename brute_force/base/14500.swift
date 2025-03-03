let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let d = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var paper = [[Int]]()
for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var answer = 0

var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)
var isChecked = Array(repeating: Array(repeating: false, count: m), count: n)
var goBack = false

func dfs(y: Int, x: Int, depth: Int, sum: Int) {
    if depth == 4 {
        answer = max(answer, sum)
        return
    }

    for (dx, dy) in d {
        let (px, py) = (dx + x, dy + y)
        guard px >= 0 && px < m && py >= 0 && py < n else { continue }
        if isChecked[py][px] { continue }

        if isVisited[py][px] {
            if goBack { continue }
            goBack = true
            dfs(y: py, x: px, depth: depth, sum: sum)
            goBack = false
        } else {
            isVisited[py][px] = true
            dfs(y: py, x: px, depth: depth + 1, sum: sum + paper[py][px])
            isVisited[py][px] = false
        }
    }
}

for y in 0..<n {
    for x in 0..<m {
        isVisited[y][x] = true
        dfs(y: y, x: x, depth: 1, sum: paper[y][x])
        isVisited[y][x] = false
        isChecked[y][x] = true
    }
}

print(answer)

// 테트로미노