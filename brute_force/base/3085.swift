let n = Int(readLine()!)!
var board = [[Character]]()
for _ in 0..<n {
    board.append(Array(readLine()!))
}

func countMaxCandies(board: [[Character]]) -> Int {
    var maxCount = 1

    for i in 0..<n {
        var rowCount = 1
        var colCount = 1

        for j in 1..<n {
            if  board[i][j] == board[i][j - 1] {
                rowCount += 1
            } else {
                maxCount = max(maxCount, rowCount)
                rowCount = 1
            }

            if  board[j][i] == board[j - 1][i] {
                colCount += 1
            } else {
                maxCount = max(maxCount, colCount)
                colCount = 1
            }
        }
        maxCount = max(maxCount, rowCount, colCount)
    }

    return maxCount
}

func swapBoard(i: Int, j: Int, ni: Int, nj: Int) {
    let temp = board[i][j]
    board[i][j] = board[ni][nj]
    board[ni][nj] = temp
}

var result = countMaxCandies(board: board)
let dx = [0, 1]
let dy = [1, 0]

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<2 {
            let ni = i + dx[k]
            let nj = j + dy[k]

            if ni < n, nj < n, board[i][j] != board[ni][nj] {
                swapBoard(i: i, j: j, ni: ni, nj: nj)
                result = max(result, countMaxCandies(board: board))
                swapBoard(i: ni, j: nj, ni: i, nj: j)
            }
        }
    }
}

print(result)

// ChatGPT 풀이
// 사탕 게임