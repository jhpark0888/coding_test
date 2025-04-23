var deque = [Int]()

for _ in 0..<(Int(readLine()!)!) {
    let c = readLine()!
    switch c {
        case let x where x.hasPrefix("push_front "):
            deque.insert(Int(x.dropFirst(11))!, at: 0)
            break
        case let x where x.hasPrefix("push_back "):
            deque.append(Int(x.dropFirst(10))!)
            break
        case "pop_front":
            if deque.isEmpty {
                print(-1)
            } else {
                print(deque.removeFirst())
            }
            break
        case "pop_back":
            if deque.isEmpty {
                print(-1)
            } else {
                print(deque.popLast()!)
            }
            break
        case "size":
            print(deque.count)
            break
        case "empty":
            print(deque.isEmpty ? 1 : 0)
            break
        case "front":
            print(deque.isEmpty ? -1 : deque.first!)
            break
        case "back":
            print(deque.isEmpty ? -1 : deque.last!)
            break
        default:
            break
    }
}

// 덱