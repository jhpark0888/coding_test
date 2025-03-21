func solution() -> Int {
    let n = Int(readLine()!)!
    if n <= 0 { return 0 }

    var lectures = [(p: Int, d: Int)]()
    var answer = 0

    for _ in 0..<n {
        let pd = readLine()!.split(separator: " ").map { Int($0)! }
        lectures.append((pd[0], pd[1]))
    }

    lectures.sort { $0.p > $1.p }
    var isVisited = Array(repeating: false, count: lectures[0].p + 1)

    for (p, d) in lectures {
        var day = d
        while day > 0 {
            if isVisited[day] {
                day -= 1
                continue
            }
            isVisited[day] = true
            answer += p
            break
        }
    }

    return answer
}

print(solution())

// 순회강연