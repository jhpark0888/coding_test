for _ in 0..<Int(readLine()!)! {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var sum = 0
    for i in 1..<(nums.count - 1) {
        for j in (i + 1)..<nums.count {
            sum += getGCD(b: nums[i], r: nums[j])
        }
    }
    print(sum)
}

func getGCD(b: Int, r: Int) -> Int {
    if b % r == 0 { return r }
    return getGCD(b: r, r: b % r)
}
// GCD 합