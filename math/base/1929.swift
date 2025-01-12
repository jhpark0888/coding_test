// let input = readLine()!.split(separator: " ").map { Int($0)! }

// for n in input[0]...input[1] {
//     if isPrimeNumber(n) { print(n) }
// }

// func isPrimeNumber(_ n: Int) -> Bool {
//     if n == 1 { return false }
//     var i = 2
//     while i * i <= n {
//         if n % i == 0 { return false }
//         i += 1
//     }
//     return true
// }

// 에라토스테네스의 체 사용
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]

var isPrime = [Bool](repeating: true, count: n)
isPrime[0] = false
var numSquareRoot = max(Int(sqrt(Double(n))), 2)

for num in (2...numSquareRoot) {
    if isPrime[num - 1] {
        for j in stride(from: num * 2, through: n, by: num) {
            isPrime[j - 1] = false
        }
    }
}

for num in (m...n) {
    if isPrime[num - 1] { print(num) }
}

// 소수 구하기