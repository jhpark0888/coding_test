import Foundation

let input = readLine()!.split(separator: " ").map { $0 }
let n = input[0]
let b = Int(input[1])!

var result = 0

for i in 0..<n.reversed().count {
    let c = n.reversed()[i]
    var num = 0
    if let temp = Int(String(c)) {
        num = temp
    } else {
        num = (Int(c.unicodeScalars.first!.value) - 65 + 10)
    }
    result += Int(pow(Double(b), Double(i))) * num
}

print(result)