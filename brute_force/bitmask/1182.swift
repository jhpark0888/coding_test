let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], s = input[1]
var sequence = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var count = 0

func back_tracking(sum: Int, start: Int) {
    if start != 0 && sum == s {
        count += 1
    }

    for i in start..<n {
        back_tracking(sum: sum + sequence[i], start: i + 1)
    }
}

back_tracking(sum: 0, start: 0)

print(count)

// 부분수열의 합