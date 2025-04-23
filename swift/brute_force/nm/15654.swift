let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.sort()
var visited = Array(repeating: false, count: n)

func back_tracking(stack: [Int]) {
    if stack.count == m {
        print(stack.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            back_tracking(stack: stack + [nums[i]])
            visited[i] = false
        }
    }
}

back_tracking(stack: [])

// N과 M (5)