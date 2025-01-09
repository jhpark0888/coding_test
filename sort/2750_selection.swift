let n = Int(readLine()!)!

var array: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    array.append(num)
}

func swap(_ i: Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}

func selectionSort(start: Int) {
    if start < array.count - 1 {
        var minIndex = start

        for i in start..<array.count {
            if array[minIndex] > array[i] {
                minIndex = i
            }
        }

        swap(minIndex, start)
        selectionSort(start: start + 1)
    }
}

selectionSort(start: 0)

for num in array {
    print(num)
}

// 선택 정렬
// 배열에서 최솟값을 선택해서 배열 앞으로 정렬
// [4, 2, 1, 3, 5] -> (1 맨 앞으로 이동)
// [1, 4, 2, 3, 5] -> (2 맨 앞으로 이동)
// [1, 2, 4, 3, 5] ...
// 시간 복잡도 n^2