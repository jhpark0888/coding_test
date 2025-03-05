let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let limit = 100_000
var visited = Array(repeating: -1, count: limit + 1)
var path = [k]
visited[n] = 0

var queue = [(n, 0)]
var index = 0

while queue.count > index {
    let (cur, count) = queue[index]

    if cur == k { 
        print(count)
        break
    }

    let nextPos = [cur - 1, cur + 1, cur * 2]

    for next in nextPos {
        if !(0...limit ~= next) || visited[next] != -1 { continue }

        visited[next] = cur
        queue.append((next, count + 1))
    }

    index += 1
}

var i = k

while i != n {
    let prev = visited[i]
    path.append(prev)
    i = prev
}

print(path.reversed().map { String($0) }.joined(separator: " "))

// 숨바꼭질4