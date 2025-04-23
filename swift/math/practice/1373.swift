import Foundation

let binaryNum: [Character] = readLine()!.reversed()
var result = ""
var value  = 0
for i in 0..<binaryNum.count {
    if i > 0 && i % 3 == 0 {
        result.append(String(value))
        value = 0
    }
    value += Int(String(binaryNum[i]))! * Int(pow(2, Double(i % 3)))
}

if value != 0 {
    result.append(String(value))
}

print( result.isEmpty ? 0 : String(result.reversed()))

// 2진수 8진수