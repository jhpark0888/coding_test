func solution() -> Int {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    var matrixA = [[Int]]()
    var matrixB = [[Int]]()
    var count = 0

    for i in 1...2 {
        for _ in 0..<n {
            let row = Array(readLine()!).map { Int(String($0))! }
            if i == 1 {
                matrixA.append(row)
            } else {
                matrixB.append(row)
            }
        }
    }

    if n < 3 || m < 3 { 
        for y in 0..<n {
            for x in 0..<m {
                if matrixA[y][x] != matrixB[y][x] { 
                    return -1
                }
            }
        }
        return 0
    }

    for y in 0..<(n - 2) {
        for x in 0..<(m - 2) {
            if matrixA[y][x] == matrixB[y][x] { continue }

            for dy in 0...2 {
                for dx in 0...2 {
                    matrixA[dy + y][dx + x] ^= 1
                }
            }
            count += 1
        }
    }

    for y in 0..<n {
        for x in 0..<m {
            if matrixA[y][x] != matrixB[y][x] { 
                return -1
            }
        }
    }


    return count
}

print(solution())

// 행렬