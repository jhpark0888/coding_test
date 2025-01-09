let n = Int(readLine()!)!

for _ in 0..<n {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let a = nums[0]
    let b = nums[1]
    print( a * b / getGCD(a, b))
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r == 0 { return b }
    return getGCD(b, r)
}

// 최소공배수