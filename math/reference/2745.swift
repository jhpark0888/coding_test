let input = readLine()!.split(separator: " ")
var num: String = String(input[0])
let formation = Int(input[1])!
let asciiA = Int(Character("A").asciiValue!)
var result = 0
var pValue = 1

for c in num.reversed() {
    if let n = Int(String(c)) {
        result += n * pValue
    } else {
        let asciiChar = Int(c.asciiValue!)
        result += (asciiChar - asciiA + 10) * pValue
    }
    pValue *= formation
}

print(result)

// 간소화 방법
// let input = readLine()!.split(separator: " ").map { String($0)}
// print(Int(input[0], radix: Int(input[1])!)!)

// 진법 변환