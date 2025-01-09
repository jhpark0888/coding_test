while true {
    guard let s = readLine() else {break}
    if s == "" {break}
    analyze(s: s)
}

func analyze(s: String) {
    var answer = Array(repeating: 0, count: 4)

    for c in s {
        if c.isLowercase {
            answer[0] += 1
        } else if c.isUppercase {
            answer[1] += 1
        } else if c.isNumber {
            answer[2] += 1
        } else if c.isWhitespace {
            answer[3] += 1
        }
    }

    print(answer.map { String($0) }.joined(separator: " "))
}

// 문자열 분석