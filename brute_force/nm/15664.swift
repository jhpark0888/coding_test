let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map { String($0) }
var visited = Array(repeating: false, count: n + 1)
var printed = [String: Bool]()

func back_tracking(start: Int, stack: String, depth: Int) {
    if depth == m {
        if let isPrinted = printed[stack], isPrinted { return }
        print(stack)
        printed[stack] = true
        return
    }

    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            back_tracking(start: i, stack: stack + "\(nums[i]) ", depth: depth + 1)
            visited[i] = false
        }
    }
}

back_tracking(start: 0, stack: "", depth: 0)

// N과 M (10)