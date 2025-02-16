let lc = readLine()!.split(separator: " ").map { Int($0)! }
let l = lc[0] , c = lc[1]
var characters: [Character] = Array(readLine()!).filter { $0 != " " }.sorted()
var vowelsCount = 0
let vowels: [Character] = ["a", "e", "i", "o", "u"]

func back_tracking(start: Int, stack: String, depth: Int) {
    if depth == l {
        if vowelsCount == 0 { return }
        if l - vowelsCount < 2 { return }
        print(stack)
        return
    }

    if start == c { return }

    for i in start..<c {
        let char = characters[i]

        if vowels.contains(char) { vowelsCount += 1 }
        back_tracking(start: i + 1, stack: stack + String(characters[i]), depth: depth + 1)
        if vowels.contains(char) { vowelsCount -= 1 }
    }
}

back_tracking(start: 0, stack: "", depth: 0)

// 암호 만들기