let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var k = input[1]
var i = k - 1

var numbers = Array(1...n)
var result = [Int]()

for _ in 0..<n {
    let num = numbers.remove(at: i)
    result.append(num)
    if numbers.isEmpty { break }
    i = ((i + k - 1) % numbers.count)
}

print("<" + result.map {"\($0)"}.joined(separator: ", ") + ">")

// 요세푸스 문제