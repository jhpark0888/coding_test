let n = Int(readLine()!)!
var meetingTime = [(start: Int, end: Int)]()
var cur = 0
var count = 0
for _ in 0..<n {
    let time = readLine()!.split(separator: " ").map { Int($0)! }
    meetingTime.append((time[0], time[1]))
}

meetingTime.sort { 
    if $0.end == $1.end {
        return $0.start < $1.start
    }
    return $0.end < $1.end
}

for (start, end) in meetingTime {
    if cur > start { continue }
    cur = end
    count += 1
}

print(count)

// 회의실 배정