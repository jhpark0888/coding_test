print(factorial(Int(readLine()!)!))

func factorial(_ n: Int) -> Int {
    var result = 1
    for i in stride(from: n, through: 1, by: -1) {
        result *= i
    }
    return result
}

// 팩토리얼