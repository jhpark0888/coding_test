let s = readLine()!
var suffixs = [String]()

for i in 0..<s.count {
    let startIndex = s.index(s.startIndex, offsetBy: i)
    suffixs.append(String(s[startIndex...]))
}

for suffix in suffixs.sorted() { print(suffix) }

// 접미사 배열