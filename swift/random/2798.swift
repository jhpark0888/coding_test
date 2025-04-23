let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

let cardNums = readLine()!.split(separator: " ").map { Int( $0 ) }
var result = 0

for i in 0..<cardNums.count {
    for j in 0..<cardNums.count {
        if i == j { continue }
        for k in 0..<cardNums.count {
            if j == k || i == k { continue }
            
            let sum = cardNums[i]! + cardNums[j]! + cardNums[k]!
            if sum > m { continue }

            result = max(result, sum)
            if result == m { break }
        }
        if result == m { break }
    }
    if result == m { break }
}

print(result)