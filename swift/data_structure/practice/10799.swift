var s = readLine()!

var result = 0
var laserStack = [Int]()
var lastC = Character("d")

for c in s {
    switch c {
        case "(":
            laserStack.append(0)
        case ")":
            if lastC == "(" {
                laserStack.removeLast()
                laserStack = laserStack.map { $0 + 1 }
                break
            }

            result += laserStack.last! + 1
            laserStack.removeLast()
            break
        default:
            break
    }
    lastC = c
}

print(result)

// 쇠막대기

// 시간 복잡도가 더 효율적

// let input = readLine()!
// var preChar: Character?
// var stack: [Character] = []
// var count = 0
// for char in input {
//     if char == "(" {
//         stack.append(char)
//     } else {
//         // char == ")"
//         let pop = stack.popLast()
//         if pop == nil { continue }
//         if preChar == "(" {
//             // 레이저
//             count += stack.count
//         } else {
//             count += 1
//         }
//     }
//     preChar = char
// }

// print(count)