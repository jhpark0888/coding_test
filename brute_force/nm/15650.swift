let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var visited = Array(repeating: false, count: n + 1)

func back_tracking(stack: [Int]) {
    if stack.count == m {
        for s in stack {
            print(s, terminator: " ")
        }
        print()
        return
    }

    for i in 1...n {
        if let last = stack.last, last >= i { continue }

        if !visited[i] {
            visited[i] = true
            back_tracking(stack: stack + [i])
            visited[i] = false
        }
    }
}

back_tracking(stack: [])

// N과 M (2)