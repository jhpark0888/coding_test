let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

func back_tracking(start: Int, stack: [Int]) {
    if stack.count == m {
        print(stack.map { String($0) }.joined(separator: " "))
        return
    }

    for i in start...n {
        back_tracking(start: i, stack: stack + [i])
    }
}

back_tracking(start: 1, stack: [])

// N과 M (4)