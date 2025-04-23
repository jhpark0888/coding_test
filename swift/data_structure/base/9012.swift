let n = Int(readLine()!)!

for _ in 0..<n {
    let vps = readLine()!
    print(isVPS(vps) ? "YES" : "NO")
}

func isVPS(_ vps: String) -> Bool {
    var count = 0
    for c in vps {
        if c == "(" {
            count += 1
        } else if c == ")" {
            count -= 1
        }

        if count < 0 { return false }
    }
    return count == 0 ? true : false
}

// 괄호