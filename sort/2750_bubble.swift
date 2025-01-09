let n = Int(readLine()!)!

var array: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    array.append(num)
}

bubbleSort(lastIndex: n - 1)

for num in array {
    print(num)
}

func swap(_ i: Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func bubbleSort(lastIndex: Int) {
    if lastIndex <= 0 { return }
    
    for i in 1...lastIndex {
        if array[i-1] > array[i] {
            swap(i-1, i)
        }
    }
    bubbleSort(lastIndex: lastIndex - 1)
}

// 버블정렬
// 배열 시작부터 좌우 값을 비교하여 정렬
// [4, 2, 1, 3, 5] -> (4, 2 비교)
// [2, 4, 1, 3, 5] -> (4, 1 비교)
// [2, 1, 4, 3, 5] ...
// 시간 복잡도 n^2