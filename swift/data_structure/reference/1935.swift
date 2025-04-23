import Foundation

let n = Int(readLine()!)!
let input: [Character] = Array( readLine()!)
var map: [Character:Int] = [:]
var stack = [Double]()
let AAscii = Int(Character("A").asciiValue!)

for i in 0..<n {
    let num = Int(readLine()!)!
    let ascii = AAscii + i    
    map[Character(UnicodeScalar(ascii)!)] = num
}

for c in input {
    if let num = map[c] {
        stack.append(Double(num))
    } else {
        let num2 = stack.popLast()!
        let num1 = stack.popLast()!
        stack.append(excute(num1, num2, c))
    }
}

print(String(format: "%.2f", stack.last!))

func excute( _ num1: Double, _ num2: Double, _ c: Character) -> Double {
    switch c {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "/":
            return num1 / num2
        case "*":
            return num1 * num2
        default:
            return 0
    }
}

// 후위 표기식2