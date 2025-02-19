// let n = Int(readLine()!)!
// let sign: [Character] = Array(readLine()!)
// var signMatrix: [[Character]] = [] 
// var curIndex = 0
// var result = [Int]()

// for i in stride(from: n, through: 1, by: -1) {
//     signMatrix.append(Array(sign[curIndex..<curIndex + i]))
//     curIndex += i
// }

// func checkSignMatrix(sequence: [Int]) -> Bool {
//     for i in 0..<sequence.count {
//         var sum = 0
//         for j in 0..<(sequence.count - i) {
//             sum += sequence[i + j]
//             if signMatrix[i][j] == "+" {
//                 if sum <= 0 { return false }
//                 continue
//             } 
            
//             if signMatrix[i][j] == "-" {
//                 if sum >= 0 { return false }
//                 continue
//             }

//             if signMatrix[i][j] == "0" {
//                 if sum != 0 { return false }
//                 continue
//             }
//         }
//     }
//     return true
// }

// func back_tracking(sequence: [Int], depth: Int) {
//     if !result.isEmpty { return }
    
//     if sequence.count == n {
//         result = sequence
//         return
//     }

//     let numSign = signMatrix[depth].first!

//     if numSign == "+" {
//         for i in 1...10 {
//             if !checkSignMatrix(sequence: sequence + [i]) { continue }
//             back_tracking(sequence: sequence + [i], depth: depth + 1)
//         }
//         return
//     }
//     if numSign == "-" {
//         for i in stride(from: -1, through: -10, by: -1) {
//             if !checkSignMatrix(sequence: sequence + [i]) { continue }
//             back_tracking(sequence: sequence + [i], depth: depth + 1)
//         }
//         return
//     }
//     if numSign == "0" {
//         back_tracking(sequence: sequence + [0], depth: depth + 1)
//         return
//     }
// }

// back_tracking(sequence: [], depth: 0)
// print(result.map { String($0) }.joined(separator: " "))

// 개선
import Foundation

let n = Int(readLine()!)!
let sign: [Character] = Array(readLine()!)
var signMatrix: [[Character]] = [] 
var curIndex = 0
var sequence = Array(repeating: 0, count: n)

for i in stride(from: n, through: 1, by: -1) {
    signMatrix.append(Array(repeating: Character("x"), count: n - i) + Array(sign[curIndex..<curIndex + i]))
    curIndex += i
}

func back_tracking(sequence: [Int], depth: Int) {
    if depth == n {
        print(sequence.map { String($0) }.joined(separator: " "))
        exit(0)
    }

    var candi = Set(-10...10)
    for i in 0...depth {
        let numSign = signMatrix[i][depth]
        let prevSum = sequence[i..<depth].reduce(0, +)

        if numSign == "+" {
            candi = candi.filter { $0 > -prevSum }
        } else if numSign == "-" {
            candi = candi.filter { $0 < -prevSum }
        } else if numSign == "0" {
            candi = candi.filter { $0 == -prevSum }
        }
    }

    for c in candi {
        back_tracking(sequence: sequence + [c], depth: depth + 1)
    }
}

back_tracking(sequence: [], depth: 0)

// 맞춰봐