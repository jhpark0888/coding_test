let s = readLine()!
let aAscii = Int(Character("a").asciiValue!)
let AAscii = Int(Character("A").asciiValue!)
var answer: [Character] = []

for c in s {
    if (c.isLowercase) {
        let cAscii = Int(c.asciiValue!)
        let rot13Ascii = (cAscii - aAscii + 13) % 26 + aAscii

        answer.append(Character(UnicodeScalar(rot13Ascii)!))
    } else if (c.isUppercase) {
        let cAscii = Int(c.asciiValue!)
        let rot13Ascii = (cAscii - AAscii + 13) % 26 + AAscii

        answer.append(Character(UnicodeScalar(rot13Ascii)!))
    } else {
        answer.append(c)
    }
}

print(answer.map { String($0) }.joined())

// ROT13