var nums = readLine()!.split(separator: " ").map { Int($0)! }
let gcd = getGCD(nums[0], nums[1])

print(gcd)
print(getLCM(nums[1], nums[0], gcd))

// Greatest Common Divisor
func getGCD(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r == 0 { return b }
    return getGCD(b, r)
}

// Least Common multiple
func getLCM(_ a: Int, _ b: Int, _ gcd: Int) -> Int {
    return (a * b) / gcd
}

// 최대공약수와 최소공배수