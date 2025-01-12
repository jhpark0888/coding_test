import Foundation

// 에라토스테네스의 체 사용
let limit = 1_000_000
var isPrime = [Bool](repeating: true, count:limit)

// 1은 소수가 아님
isPrime[0] = false

for i in (2...Int(sqrt(Double(limit)))) {
    if isPrime[i - 1] {
        for j in stride(from: i * i, through: limit, by: i) {
            isPrime[j - 1] = false
        }
    }
}

while true {
    let num = Int(readLine()!)!
    if num == 0 { break }

    var oddNum = 3
    while true {
        if oddNum > num / 2 {
            print("Goldbach's conjecture is wrong.")
        }

        if isPrime[oddNum - 1] && isPrime[num - oddNum - 1] {
            print("\(num) = \(oddNum) + \(num - oddNum)")
            break
        }

        oddNum += 2
    }
}

// // 골드바흐의 추측