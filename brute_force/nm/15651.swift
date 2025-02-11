let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

func back_tracking(stack: String) {
    if stack.count == (2 * m) {
        print(stack)
        return
    }

    for i in 1...n {
        back_tracking(stack: stack + "\(i) ")
    }
}

back_tracking(stack: "")

// N과 M (3)