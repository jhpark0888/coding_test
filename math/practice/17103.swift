import Foundation

var limit = 1_000_000
var isPrime = Array(repeating: true, count: limit + 1)
isPrime[0] = false
isPrime[1] = false

for i in 2...Int(sqrt(Double(limit))) {
    if isPrime[i] {
        for j in stride(from: i * 2, to: limit, by: i) {
            isPrime[j] = false
        }
    }
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let num = Int(readLine()!)!
    var patitionCount = 0

    for i in 2...(num / 2) {
        if !isPrime[i] { continue }
        if isPrime[num - i] {
            patitionCount += 1
        }
    }
    print(patitionCount)
}

// 골드바흐 파티션