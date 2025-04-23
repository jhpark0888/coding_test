let n = Int(readLine()!)!
var numCount:[Int:Int] = [:]
var numbers:[Int] = readLine()!.split(separator: " ").map { 
    let num: Int = Int($0)!
    numCount[num] = (numCount[num] ?? 0) + 1
    return num
}

var result = Array(repeating: -1, count: n)
var stack: [(Int, Int)] = []

for (index, num) in numbers.enumerated() {
    while let last = stack.last, numCount[last.1]! < numCount[num]! {
        result[last.0] = num
        stack.removeLast()
    }
    stack.append((index, num))
}

print(result.map { String($0) }.joined(separator: " "))

// 오등큰수