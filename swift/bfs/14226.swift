let s = Int(readLine()!)!
let limit = 1000
var queue = [(0, 1, 0)]
var index = 0
var checked = Array(repeating: [Int](), count: limit + 1)

while queue.count > index {
    let (time, count, clipboard) = queue[index]

    if count == s { 
        print(time)
        break
    }

    for i in 0..<3 {
        var nextCount = count
        var nextClipBoard = clipboard
        // 클립보드에 저장
        if i == 0 {
            if count == clipboard { continue }
            nextClipBoard = count
        // 클립보드 붙여넣기
        } else if i == 1 {
            if clipboard == 0 { continue }
            nextCount = count + clipboard
        // 이모티콘 하나 삭제
        } else {
            if count == 0 { continue }
            nextCount = count - 1
        }
        if nextCount > limit { continue }
        if checked[nextCount].contains(nextClipBoard) { continue }

        checked[nextCount].append(nextClipBoard)
        queue.append((time + 1, nextCount, nextClipBoard)) 
    }

    index += 1
}

// 이모티콘