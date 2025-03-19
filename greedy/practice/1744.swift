let n = Int(readLine()!)!
var positives = [Int]()
var negatives = [Int]()
var isZero = false
var sum = 0

for _ in 0..<n {
    let num = Int(readLine()!)!
    if num > 0 {
        positives.append(num)
    } else if num == 0 {
        isZero = true
    } else {
        negatives.append(num)
    }
}

positives.sort { $0 > $1 }
negatives.sort()

for i in stride(from: 0, to: positives.count, by: 2) {
    let first = positives[i]
    if i + 1 >= positives.count {
        sum += first
        break
    }

    let second = positives[i + 1]
    sum += first * second
    if first == 1 || second == 1 { sum += 1 }
}

for i in stride(from: 0, to: negatives.count, by: 2) {
    if i + 1 >= negatives.count {
        if isZero { break }
        sum += negatives[i]
        break
    }

    sum += negatives[i] * negatives[i + 1]
}

print(sum)

// 수 묶기