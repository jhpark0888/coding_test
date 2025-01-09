let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: 0, count: n)

for i in stride(from: n - 1, through: 0, by: -1) {
    if i == n - 1 {
        result[i] = -1
        continue
    }

    if numbers[i + 1] > numbers[i] {
        result[i] = i + 1
        continue
    }

    var index = i + 1
    while result[i] == 0 {
        if result[index] == -1 {
            result[i] = -1
            break
        }

        if numbers[i] < numbers[result[index]] {
            result[i] = result[index]            
        } else {
            index = result[index]
        }
    }
}

print(result.map { $0 == -1 ? "-1" : "\(numbers[$0])" }.joined(separator: " "))

// 오큰수

// 스택을 사용해서 오큰수를 찾지 못한 인덱스와 숫자를 저장해놓고 비교
// let N = Int(readLine()!)!
// let A = readLine()!.split(separator: " ").map{Int($0)!}
// var answer = Array(repeating: -1, count: N)
// var stack = [(Int, Int)]()

// for (index, num) in A.enumerated() {
//     while let last = stack.last, last.0 < num  {
//         answer[last.1] = num
//         stack.removeLast()
//     }
//     stack.append((num, index))
// }

// print(answer.map{String($0)}.joined(separator: " "))