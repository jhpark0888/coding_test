let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.sort()
var visited = Array(repeating: false, count: n)

func back_tracking(start: Int, stack: [Int]) {
    if stack.count == m {
        print(stack.map { String($0) }.joined(separator: " "))
        return
    }

    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            back_tracking(start: i, stack: stack + [nums[i]])
            visited[i] = false
        }
    }
}

back_tracking(start: 0, stack: [])

// N과 M (6)