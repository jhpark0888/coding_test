var posList = Array(repeating: -1, count: 26)
let aAscii = Int(Character("a").asciiValue!)

for (i, c) in Array(readLine()!).enumerated() {
    let cAscii = Int(c.asciiValue!)
    let index = cAscii - aAscii
    if posList[index] != -1 { continue } 

    posList[index] = i
}

print(posList.map {String($0)}.joined(separator: " "))

// 알파벳 찾기