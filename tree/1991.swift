let n = Int(readLine()!)!
var tree = [Character:[Character]]()

for _ in 0..<n {
    let nodes = readLine()!.split(separator: " ").map { Character(String($0)) }
    let parent = nodes[0]

    tree[parent, default: []].append(nodes[1])
    tree[parent, default: []].append(nodes[2])
}

func preOrder(start: Character) {
    print(start, terminator: "")

    for c in tree[start]! {
        if c == "." { continue }

        preOrder(start: c)
    }
}

func inOrder(start: Character) {
    for i in 0..<2 {
        if i == 1 {
            print(start, terminator: "")
        }

        let c = tree[start]![i]
        if c == "." { continue }
        inOrder(start: c)
    }
}

func postOrder(start: Character) {
    for c in tree[start]! {
        if c == "." { continue }

        postOrder(start: c)
    }
    print(start, terminator: "")
}

preOrder(start: "A")
print()
inOrder(start: "A")
print()
postOrder(start: "A")
print()

// 트리 순회

// 더 나은 풀이
// let n = Int(readLine()!)!
// var tree = [Character:[Character]]()

// for _ in 0..<n {
//     let nodes = readLine()!.split(separator: " ").map { Character(String($0)) }
//     let parent = nodes[0]

//     tree[parent, default: []].append(nodes[1])
//     tree[parent, default: []].append(nodes[2])
// }

// var preAnswer = ""
// var inAnswer = ""
// var postAnswer = ""

// func dfs(cur: Character) {
//     if cur == "." { return }

//     preAnswer.append(cur)
//     dfs(cur: tree[cur]![0])
//     inAnswer.append(cur)
//     dfs(cur: tree[cur]![1])
//     postAnswer.append(cur)
// }

// dfs(cur: "A")

// print(preAnswer)
// print(inAnswer)
// print(postAnswer)