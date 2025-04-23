while true {
    var nums = readLine()!.split(separator: " ").map { Int($0)! }
    if nums.count == 1 { break }

    let n = nums.removeFirst()
    var visited = Array(repeating: false, count: n)
    func back_tracking(i: Int, stack: String, depth: Int) {
        if depth == 6 {
            print(stack)
            return
        }

        for i in i..<n {
            if !visited[i] {
                visited[i] = true
                back_tracking(i: i, stack: stack + "\(nums[i]) ", depth: depth + 1)
                visited[i] = false
            }
        }
    }

    back_tracking(i: 0, stack: "", depth: 0)
    print()
}

// 로또