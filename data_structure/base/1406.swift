var left: [Character] = Array(readLine()!)
var right: [Character] = []

for _ in 0..<Int(readLine()!)! {
    let command = readLine()!
    switch command {
        case "L":
            if let c = left.popLast() {
                right.append(c)
            }
            break
        case "D": 
            if let c = right.popLast() {
                left.append(c)
            }
            break
        case "B":
            if !left.isEmpty { left.removeLast() }
            break
        case let p where p.hasPrefix("P "):
            left.append(p.dropFirst(2).first!)
            break
        default:
            break
        // 아래 코드로 진행할 경우 0.3초 시간 초과
        // split을 사용하면 문자열이 길 경우 비효율적이므로 dropFirst 후 first 사용하는 게 효율적
        // default:
        //     left.append(command.split(separator: " ")[1].first!)
        
    }
}

print(String(left + right.reversed()))

// 에디터