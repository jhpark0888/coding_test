let n = Int(readLine()!)!
var count = 0

for num in readLine()!.split(separator: " ") {
    if isPrimeNumber(Int(num)!) { count += 1 }
}

print(count)

func isPrimeNumber(_ n: Int) -> Bool {
    if n == 1 { return false }
    var i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}

// 소수 찾기