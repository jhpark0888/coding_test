// 다른 사람 풀이 참고
let N = Int(readLine()!)!
let brokenCount = Int(readLine()!)!
var broken: [Int] = []
if brokenCount > 0 {
    broken = readLine()!.split(separator: " ").map { Int($0)! }
}

func pressCount(n: Int) -> Int {
    var num =  n
    var count = 0

    if n == 0 {
        if broken.contains(0) {
            return 0 
        } else {
            return 1
        }
    }

    while num > 0 {
        if broken.contains( num % 10 ) { return 0 }

        num /= 10
        count += 1
    }

    return count
}

var result = abs(N - 100)

for n in 0...1_000_000 {
    let count = pressCount(n: n)

    if count > 0 {
        result = min(result, abs(N - n) + count)
    }
}

print(result)

// 내 풀이
// String을 Int로 Int를 String으로 변환하는 과정에서 시간이 많이 소요되는 듯함

// let N = readLine()!
// let brokenCount = Int(readLine()!)!
// var broken: [String] = []
// if brokenCount > 0 {
//     broken = readLine()!.split(separator: " ").map { String($0) }
// }
// let isUnavailableZero = broken.contains("0")

// var available = (1...9).map { String($0) }
// available.removeAll { broken.contains($0) }
// available.append("0")

// var result = abs(Int(N)! - 100)

// for i in available {
//     for j in available {
//         for k in available {
//             for l in available {
//                 for m in available {
//                     for n in available {
//                         let temp = Int(i + j + k + l + m + n)!
//                         if isUnavailableZero && String(temp).contains("0") { continue }

//                         result = min(result, abs(Int(N)! - temp) + String(temp).count)
//                     }
//                 }
//             }
//         }
//     }
// }

// print(result)

// 리모컨