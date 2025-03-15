let input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
var k = input[1]

var coins: [Int] = []
var result = 0

for _ in 0..<n {
    let coin = Int(readLine()!)!
    if (coin <= k) {
        coins.insert(coin, at: 0)
    }
}

for coin in coins {
    result += Int(k / coin)
    k = k % coin
}

print(result)

// 동전 O