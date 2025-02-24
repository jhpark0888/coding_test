let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var paper = [[Int]]()

for _ in 0..<n {
    paper.append(Array(readLine()!.map { Int(String($0))! }))
}

func getMaxSum(paper: [[Int]], n: Int, m: Int) -> Int {
    var rowFirst = 0
    var rowLast = 0
    var colFirst = 0
    var colLast = 0

    for i in 0..<m {
        rowFirst = rowFirst * 10 + paper[0][i]
        if n != 1 { rowLast = rowLast * 10 + paper[n - 1][i] }
    }

    for i in stride(from: n - 1, through: 0, by: -1) {
        colFirst = colFirst * 10 + paper[i][0]
        if m != 1 { colLast = colLast * 10 + paper[i][m - 1] } 
    }

    if n == 1 || m == 1 { return max(rowFirst, rowLast, colFirst, colLast) }

    rowFirst += getMaxSum(paper: Array(paper.dropFirst()), n: n - 1, m: m)
    rowLast += getMaxSum(paper: Array(paper.dropLast()), n: n - 1, m: m)
    colFirst += getMaxSum(paper: paper.map { Array($0.dropFirst())}, n: n, m: m - 1)
    colLast += getMaxSum(paper: paper.map { Array($0.dropLast()) }, n: n, m: m - 1)
    
    return max(rowFirst, rowLast, colFirst, colLast)
}

print(getMaxSum(paper: paper, n: n, m: m))

// 비트마스크 활용 (ChatGPT 풀이)
// let nm = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nm[0], m = nm[1]
// var paper = [[Int]]()
// var result = 0

// for _ in 0..<n {
//     paper.append(Array(readLine()!.map { Int(String($0))! }))
// }

// // 0: 가로, 1: 세로
// for bitmask in 0..<1<<(n * m) {
//     var totalSum = 0

//     // 가로 방향으로 자를 때
//     for i in 0..<n {
//         var rowSum = 0
//         for j in 0..<m {
//             let index = i * m + j
//             if bitmask & (1<<index) != 0 {
//                 totalSum += rowSum
//                 rowSum = 0
//             } else {
//                 rowSum = rowSum * 10 + paper[i][j]
//             }
//         }
//         totalSum += rowSum
//     }

//     // 세로 방향으로 자를 때
//     for i in 0..<m {
//         var colSum = 0
//         for j in 0..<n {
//             let index = j * m + i
//             if bitmask & (1<<index) == 0 {
//                 totalSum += colSum
//                 colSum = 0
//             } else {
//                 colSum = colSum * 10 + paper[j][i]
//             }
//         }
//         totalSum += colSum
//     }

//     result = max(result, totalSum)
// }

// print(result)

// 종이 조각