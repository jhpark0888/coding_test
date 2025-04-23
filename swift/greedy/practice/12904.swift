let s = readLine()!
var t = readLine()!

while t.count > s.count {
    if t.last == "A" {
        t.removeLast()
    } else {
        t.removeLast()
        t = String(t.reversed())
        
    }
}

print(s == t ? 1 : 0)

// A와 B