// print(factorialZeroCount(Int(readLine()!)!))

// func factorialZeroCount(_ n: Int) -> Int {
//     if n == 0 { return 0 }

//     var result = 1
//     var count = 0
//     for i in (1...n) {
//         result *= i
//         while result % 10 == 0 {
//             result /= 10
//             count += 1
//         }
//         result %= 1_000_000_000_000
//     }
//     return count
// }

// 5의 인수 계산
print(countTrailingZero(Int(readLine()!)!))

func countTrailingZero(_ n: Int) -> Int {
    var count = 0
    var powerOfFive = 5
    while n >= powerOfFive {
        count += n / powerOfFive
        powerOfFive *= 5
    }
    return count
}

// 팩토리얼 0의 개수