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

func heap(end: Int) {
    for i in 1...end {
        var c = i
        while c != 0 {
            // 부모노드 index
            let root = (c - 1) / 2
            if array[root] < array[c] {
                swap(root, c)
            }
            c = root
        }
    }
}

func heapSort(start: Int, end: Int) {
    if start < end {
        heap(end: end)
        swap(start, end)
        heapSort(start: start, end: end - 1)
    }
}

heapSort(start: 0, end: array.count - 1)

for num in array {
    print(num)
}

// 힙 정렬
// 추가적인 메모리가 필요하지 않아 병합 정렬보다 효율적
// 배열을 힙 구조로 만들고 최대/최소 노드를 마지막/처음으로 보내서 정렬
// 시간 복잡도: nlogn