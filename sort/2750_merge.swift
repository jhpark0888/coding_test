let n = Int(readLine()!)!

var array: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    array.append(num)
}

func mergeSort(start: Int, end: Int) {
    if start < end {
        let mid = (start + end) / 2
        mergeSort(start: start, end: mid)
        mergeSort(start: mid + 1, end: end)
        merge(start: start, mid: mid, end: end)
    }
}

func merge(start: Int, mid: Int, end: Int) {
    var tempList: [Int] = Array(repeating: 0, count: array.count)
    for num in start...end {
        tempList[num] = array[num]
    }

    var part1 = start
    var part2 = mid + 1
    var index = start

    while part1 <= mid && part2 <= end {
        if tempList[part1] <= tempList[part2] {
            array[index] = tempList[part1]
            part1 += 1
        } else {
            array[index] = tempList[part2]
            part2 += 1
        }
        index += 1
    }

    if (mid - part1 >= 0) {
        for i in 0...mid - part1 {
            array[index + i] = tempList[part1 + i]
        }
    }
}   

mergeSort(start: 0, end: array.count - 1 )

for num in array {
    print(num)
}

// 병합 정렬
// 가운데를 기준으로 배열을 나눠 정렬한 후 병합
// 임시 배열이 필요
// [4, 2, 1, 3, 5] -> [4, 2, 1], [3, 5]
// [4, 2, 1] -> [4], [2, 1] -> 정렬 후 병합 [1, 2, 4]
// [3, 5] -> [3], [5] -> 정렬 후 병합 [3, 5] 
// [1, 2, 4], [3, 5] -> 최솟값을 아직 정렬되지 않은 인덱스에 저장 후 다음 값은 다음 인덱스에 저장
// [1, 2, 3, 4, 5]
// 시간 복잡도: nlogn