// let n = Int(readLine()!)!

// var list: [String] = []

// for _ in 0..<n {
//     let sentence = readLine()!
//     list.append(sentence)
// }

// func printReverseSentence(s: String) {
//     let reversedSentence = s.split(separator: " ")
//     var str = ""
//     for i in 0..<reversedSentence.count {
//         if i != 0 { str += " " }
//         str += reversedSentence[i].reversed()
//     }
//     print(str)
// }

// for s in list {
//     printReverseSentence(s: s)
// }

let n = Int(readLine()!)!

for _ in 0..<n {
    let sentence = readLine()!.split(separator: " ").map { String($0.reversed()) }
    print(sentence.joined(separator: " "))
}

// 단어 뒤집기