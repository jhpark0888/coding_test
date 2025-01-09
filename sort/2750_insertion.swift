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

func insertionSort(start: Int) {
    if start > array.count - 1 { return }

    let key = array[start]
    var i: Int = start-1

    while i >= 0 {
        if array[i] > key {
            array[i+1] = array[i]
        } else {
            break
        }
        i -= 1
    }
    
    array[i+1] = key
    insertionSort(start: start+1)
}

insertionSort(start: 1)


for num in array {
    print(num)
}

// 삽입 정렬
// 배열에서 첫번째 인덱스 값부터 앞의 값과 비교하여 맞는 위치에 삽입
// [4, 2, 1, 3, 5] -> (key: 2, 4와 비교) [2, 4, 1, 3, 5]
// [2, 4, 1, 3, 5] -> (key: 1, 4와 비교) [2, 1, 4, 3, 5] (key: 1, 2와 비교) [1, 2, 4, 3, 5]
// [1, 2, 4, 3, 5] ...
// 시간 복잡도 n^2