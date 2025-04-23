struct priority_queue {
    // max heap
    var heap = [Int]()

    func heapCount() -> Int { return heap.count }

    func getParentIndex(i: Int) -> Int { return (i - 1) / 2 }

    func getLeftChildIndex(i: Int) -> Int { return i * 2 + 1 }

    func getRightChildIndex(i: Int) -> Int { return i * 2 + 2 }

    mutating func enqueue(n: Int) {
        heap.append(n)
        siftup(index: heap.count - 1)
    }

    mutating func siftup(index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating func dequeue() -> Int? {
        if heap.isEmpty { return nil }

        heap.swapAt(0, heap.count - 1)
        let n = heap.removeLast()
        siftdown(index: 0)
        return n
    }

    mutating func siftdown(index: Int) {
        var parent = index
        while true {
            let left = parent * 2 + 1
            let right = parent * 2 + 2
            var candidate = parent
            
            if left < heap.count && heap[candidate] < heap[left] {
                candidate = left
            }

            if right < heap.count && heap[candidate] < heap[right] {
                candidate = right
            }

            if parent == candidate { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var jewels = [(m: Int, v: Int)]()
var bags = [Int]()
var answer = 0

for _ in 0..<n {
    let mv = readLine()!.split(separator: " ").map { Int($0)! }
    jewels.append((mv[0], mv[1]))
}

for _ in 0..<k {
    let c = Int(readLine()!)!
    bags.append(c)
}

jewels.sort { $0.m < $1.m }
bags.sort()

var jewelIndex = 0
var maxHeap = priority_queue()

for c in bags {
    while jewelIndex < n, jewels[jewelIndex].m <= c {        
        let v = jewels[jewelIndex].v
        maxHeap.enqueue(n: v)
        jewelIndex += 1
    }

    if let bestJewel = maxHeap.dequeue() {
        answer += bestJewel
    }
}

print(answer)

// 보석 도둑