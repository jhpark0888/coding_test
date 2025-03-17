let expression: [Character] = Array(readLine()!)
var nums = [Int]()
var operators = [Character]()
var temp = ""

for c in expression {
    if c == "+" || c == "-" { 
        nums.append(Int(temp)!)
        temp = ""

        operators.append(c) 
        continue
    }
    
    temp.append(c)
}
nums.append(Int(temp)!)

var answer = nums[0]
var weight = 1

for i in 1..<nums.count {
    let oper = operators[i - 1]
    let num = nums[i]

    if oper == "-" { weight = -1 }
    answer += weight * num
}

print(answer)

// 잃어버린 괄호

// 간편 풀이
// let nums = readLine()!.split(separator: "-").map { $0.split(separator: "+").map { Int($0)! }.reduce(0, +)}
// print(nums.count == 1 ? nums[0] : nums[1...].reduce(nums[0], -))