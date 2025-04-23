let n = Int(readLine()!)!

var array: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    array.append(num)
}

func swap(_ i :Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}


func QuickSort(start: Int, end: Int) {
    let part2 : Int = partition(start, end)
    if start < part2 - 1 {
        QuickSort(start: start, end: part2 - 1)
    }
    if part2 < end {
        QuickSort(start: part2, end: end)
    }
}

func partition(_ start: Int,_ end: Int) -> Int {
    var startIndex = start
    var endIndex = end
    let pivot = array[(start + end) / 2]
    
    while startIndex <= endIndex {
        while array[startIndex] < pivot { startIndex += 1 }
        while array[endIndex] > pivot { endIndex -= 1 }
        if (startIndex <= endIndex) {
            swap(startIndex, endIndex)
            startIndex += 1
            endIndex -= 1
        }
    }
    return startIndex
}

QuickSort(start: 0, end: array.count - 1)

for num in array {
    print(num)
}

// 퀵 정렬
// 기준을 정하고 기준보다 작은 값은 기준 왼쪽에 기준보다 높은 값을 기준 오른쪽에 배치
// [4, 2, 1, 3, 5] -> pivot: 1 [(1), 2, 4, 3, 5]
// [2, 4, 3, 5] -> pivot: 4 [2, 3, (4), 5]
// [2, 3] -> [2, 3]
// [4, 5] -> [4, 5]
// 시간 복잡도: nlogn