let input = readLine()!.split(separator: " ").map { Int($0)! }
var num = input[0]
var formation = input[1]
let asciiA = Int(Character("A").asciiValue!)
var result = ""

while num != 0 {
    result.append(getValue(num % formation))
    num /= formation
}

print(String(result.reversed()))

func getValue(_ n: Int) -> Character {
    if n < 10 { return String(n).first! }
    return Character(UnicodeScalar(asciiA + n - 10)!)
}

// 간소화 방법
// let input = readLine()!.split(separator: " ").map { Int($0)! }
// print(String(input[0], radix: input[1], uppercase: true))

// 진법 변환2