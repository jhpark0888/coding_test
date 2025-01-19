import Foundation

let octalNum: [Character] = Array(readLine()!)
var result = ""

for c in octalNum {
    var n = Int(String(c))!
    for i in stride(from: 2, through: 0, by: -1) {
        if n >= Int(pow(2, Double(i))) {
            result += "1"
        } else {
            result += "0"
        }
        n %= Int(pow(2, Double(i)))
    }
}

while result.count != 1 && result.first == "0" {
    result.removeFirst()
}

print(result)

// 8진수 2진수