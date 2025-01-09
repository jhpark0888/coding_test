let s = readLine()!

var stack = [Character]()
var result = [Character]()
var isTag = false

for c in s {
    if c == "<" {
        isTag = true
        inputReversedWord()
        result.append(c)
        continue
    }
    if c == ">" {
        isTag = false
        result.append(c)
        continue
    }

    if isTag {
        result.append(c)
    } else {
        if c == " " {
            inputReversedWord()
            result.append(c)
        } else {
            stack.append(c)
        }
    }
}

inputReversedWord()

print(String(result))

func inputReversedWord() {
    while !stack.isEmpty {
                result.append(stack.popLast()!)
    }
}

// 단어 뒤집기 2