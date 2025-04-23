let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map { String($0) }

func back_tracking(start: Int, stack: String, depth: Int) {
    var last = ""
    if depth == m {
        print(stack)
        return
    }

    for i in start..<n {
        if last == nums[i] { continue }
        back_tracking(start: i, stack: stack + "\(nums[i]) ", depth: depth + 1)
        last = nums[i]
    }
}

back_tracking(start: 0, stack: "", depth: 0)

// N과 M (12)