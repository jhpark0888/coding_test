var input = Int(readLine() ?? "")

if let _ = input {
    let numList = readLine()?.split(separator: " ").map { num in
        Int(num)
    } ?? []

    // 길이에 해당하는 최솟값
    var lengthToMinNum: [Int: Int] = [:]
    var numToLength: [Int: Int] = [:]
    
    for i in 0..<numList.count {
        let num = numList[i] ?? 0
        if num == 0 { continue }

        let maxLengthMinNum  = lengthToMinNum.values.filter { (value: Int) in
            value < num
        }.max() ?? 0
        
        let maxLength = numToLength[maxLengthMinNum] ?? 0
        lengthToMinNum[maxLength + 1] = min(lengthToMinNum[maxLength + 1] ?? Int.max, num)
        numToLength[num] = maxLength + 1
    }
    
    print(lengthToMinNum.keys.max() ?? 0)
}

// ChatGPT 풀이
let n = Int(readLine()!)!

let sequence = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if (sequence[i] > sequence[j]) {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)