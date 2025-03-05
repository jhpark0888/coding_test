// enum move: CaseIterable {
//     case go;
//     case back;
//     case teleport;

//     func execute(_ x: Int) -> Int {
//         switch self {
//             case .go:
//                 return x + 1
//             case .back:
//                 return x - 1
//             case .teleport:
//                 return x * 2
//         }
//     }
// }

let nk = readLine()!.split(separator: " ").map { Int($0)! }
var n = nk[0]
let k = nk[1]
let limit = 100_000
var isVisited = Array(repeating: false, count: limit + 1)
var queue = [(n, 0)]
isVisited[n] = true

while !queue.isEmpty {
    let (cur, count) = queue.removeFirst()

    if cur == k { 
        print(count)
        break
    }

    let nextPos = [cur - 1, cur + 1, cur * 2]

    for next in nextPos {
        if next < 0 || next > limit { continue }
        if isVisited[next] { continue }

        isVisited[next] = true
        queue.append((next, count + 1))
    }
}

// 숨바꼭질