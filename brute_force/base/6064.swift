let k = Int(readLine()!)!

for _ in 0..<k {
    let testCase = readLine()!.split(separator: " ").map { Int($0)! }
    let (M, N, x, y) = (testCase[0], testCase[1], testCase[2], testCase[3])

    var temp = x
    while temp <= M * N {
        if (temp % N == 0 ? N : temp % N) == y { break }
        temp += M
    }

    if temp <= M * N {
        print(temp)
    } else {
        print(-1)
    }
}

// 카잉 달력