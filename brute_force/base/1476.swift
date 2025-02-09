let esm = readLine()!.split(separator: " ").map { Int($0)! }
let (e, s, m) = (esm[0], esm[1], esm[2])
var i = 0

while true {
    let temp = i * 28 + s
    let tempE = temp % 15 == 0 ? 15 : temp % 15
    let tempM = temp % 19 == 0 ? 19 : temp % 19
    if tempE == e && tempM == m { break }
    i += 1
}

print(i * 28 + s)

// 날짜 계산