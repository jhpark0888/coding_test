let n = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: n + 1)
var square = [Int: [Int]]()
var col = 1
var answerRow = 0
var answerWidth = 0

var isRoot = Array(repeating: true, count: n + 1)
isRoot[0] = false

for _ in 0..<n {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    let left = nodes[1]
    let right = nodes[2]

    if left != -1 {
        isRoot[left] = false
    }
    if right != -1 {
        isRoot[right] = false
    }

    tree[nodes[0]] = [left, right]
}

func dfs(parent: Int, row: Int) {
    let childs = tree[parent]
    let left = childs[0]
    let right = childs[1]

    if left != -1 {
       dfs(parent: left, row: row + 1)
    }

    square[row, default: []].append(col)
    col += 1

    if right != -1 {
        dfs(parent: right, row: row + 1)    
    }
}

var root = isRoot.firstIndex { $0 }!
dfs(parent: root, row: 1)

for row in 1...square.keys.max()! {
    let columns = square[row]!
    let width = columns.max()! - columns.min()! + 1

    if answerWidth < width {
        answerRow = row
        answerWidth = width
    }
}

print("\(answerRow) \(answerWidth)")

// 트리의 높이와 넓이