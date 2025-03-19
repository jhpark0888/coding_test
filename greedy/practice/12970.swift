let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
var k = nk[1]
var s = Array(repeating: "B", count: n)
var aCount = 0

for i in 1...n {
    if (k + aCount) - (n - i) >= 0 {
        let index = i - 1
        k = k + aCount - (n - i)

        s[index] = "A"
        aCount += 1
    }

    if k == 0 { break }
}

print(k == 0 ? s.joined(separator: "") : -1)

// AB