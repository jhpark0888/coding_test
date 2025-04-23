var n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var answer = 0

for time in p {
    answer += time * n
    n -= 1
}

print(answer)

// ATM