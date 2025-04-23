let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let countPowFive = countPowerOfFive(n) - countPowerOfFive(m) - countPowerOfFive(n - m) 
let countPowTwo = countPowerOfTwo(n) - countPowerOfTwo(m) - countPowerOfTwo(n - m) 

print(min(countPowFive, countPowTwo))

func countPowerOfFive(_ n: Int) -> Int {
    var count = 0
    var powerOfFive = 5
    while n >= powerOfFive {
        count += n / powerOfFive
        powerOfFive *= 5
    }
    return count
}
func countPowerOfTwo(_ n: Int) -> Int {
    var count = 0
    var powerOfTwo = 2
    while n >= powerOfTwo {
        count += n / powerOfTwo
        powerOfTwo *= 2
    }
    return count
}

// 조합 0의 개수