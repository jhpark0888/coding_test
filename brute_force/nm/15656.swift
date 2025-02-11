let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map { String($0) }

func back_tracking(stack: String, depth: Int) {
    if depth == m {
        print(stack)
        return
    }

    for i in 0..<n {
        back_tracking(stack: stack + "\(nums[i]) ", depth: depth + 1)
    }
}

back_tracking(stack: "", depth: 0)

// N과 M (7)