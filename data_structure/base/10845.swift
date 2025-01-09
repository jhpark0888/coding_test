var queue: [Int] = []

for _ in 0..<(Int(readLine()!)!) {
    let c = readLine()!
    switch c {        
        case "pop":
            if queue.isEmpty {
                print(-1)
            } else {
                print(queue.removeFirst())
            }
            break
        case "size":
            print(queue.count)
            break
        case "empty":
            print(queue.isEmpty ? 1 : 0)
            break
        case "front":
            print(queue.isEmpty ? -1 : queue.first!)
            break
        case "back":
            print(queue.isEmpty ? -1 : queue.last!)
            break
        case let x where x.hasPrefix("push "):
            queue.append(Int(x.dropFirst(5))!)
            break
        default:
            break
    }
}

// 큐