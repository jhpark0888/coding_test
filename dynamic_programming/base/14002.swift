let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)
var prevNumIndexs = Array(repeating: -1, count: n)

for i in 1..<n {
    var temp = dp[i]
    var tempPrevNumIndex = prevNumIndexs[i]
    for j in 0..<i {
        if nums[j] < nums[i] {
            if temp < dp[j] + 1 {
                temp = dp[j] + 1
                tempPrevNumIndex = j
            }
        }
    }
    dp[i] = temp
    prevNumIndexs[i] = tempPrevNumIndex
}

let maxLength = dp.max()!
var numIndex = dp.firstIndex(of: maxLength)!
var maxNumList = [Int]()

while numIndex != -1 {
    maxNumList.append(nums[numIndex])
    numIndex = prevNumIndexs[numIndex]
}

print(maxLength)
print(maxNumList.reversed().map { String($0) }.joined(separator: " "))

// 가장 긴 증가하는 부분 수열4