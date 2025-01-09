let input = readLine()!.split(separator: " ").map { Int($0)! }

for n in input[0]...input[1] {
    if isPrimeNumber(n) { print(n) }
}

func isPrimeNumber(_ n: Int) -> Bool {
    if n == 1 { return false }
    var i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}

// 소수 구하기