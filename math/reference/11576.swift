let radixs = readLine()!.split(separator: " ").map { Int($0)! }
var n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
let a = radixs[0]
let b = radixs[1]
var radix10 = 0
var result = [Int]()

var q = 1
for an in nums.reversed() {
    radix10 += an * q
    q *= a
}

while radix10 != 0 {
    result.append(radix10 % b)
    radix10 /= b
}

for r in result.reversed() {
    print(r, terminator: " ")
}

// Base Conversion