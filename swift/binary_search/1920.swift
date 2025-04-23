let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }

a.sort()

func binary_search(target: Int) -> Int {
    var left = 0
    var right = a.count - 1

    while left <= right {
        let mid = (left + right) / 2
        let midNum = a[mid]

        if midNum == target { return 1 }
        if midNum > target {
            right = mid - 1  
        } else if midNum < target {
            left = mid + 1
        }
    }

    return 0
}

for num in nums {
    print(binary_search(target: num))
}

// 수 찾기