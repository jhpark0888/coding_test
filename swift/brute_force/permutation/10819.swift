let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: n)
var maxValue = 0

func getDifferenceSum(arr: [Int]) -> Int {
    var sum = 0
    for i in 0..<(n - 1) {       
        sum += abs(arr[i] - arr[i + 1])
    }
    return sum
}

func back_tracking(stack: [Int]) {
    if stack.count == n {
        maxValue = max(maxValue, getDifferenceSum(arr: stack))
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
print(maxValue)

// 차이를 최대로