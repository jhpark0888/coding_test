let n = Int(readLine()!)!
var visited = Array(repeating: false, count: n + 1)

func back_tracking(stack: String, depth: Int) {
    if depth == n {
        print(stack)
        return
    }

    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            back_tracking(stack: stack + "\(i) ", depth: depth + 1)
            visited[i] = false
        }
    }
}

back_tracking(stack: "", depth: 0)

// 모든 순열