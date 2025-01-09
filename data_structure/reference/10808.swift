var countList = Array(repeating: 0, count: 26)
let aAscii = Int(Character("a").asciiValue!)

for c in readLine()! {
    let cAscii = Int(c.asciiValue!)
    countList[cAscii - aAscii] = countList[cAscii - aAscii] + 1
}

print(countList.map {String($0)}.joined(separator: " "))

// 알파벳 개수