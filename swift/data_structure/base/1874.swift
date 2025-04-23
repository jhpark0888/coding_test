let n = Int(readLine()!)!

var numberList: [Int] = []
var stack: [Int] = []
var result = ""
var numIndex = 0

for _ in 0..<n { numberList.append(Int(readLine()!)!) }

for i in 1...n {
    push(i)
    while !stack.isEmpty && stack.last! == numberList[numIndex] {
        pop()
    }
}

if !stack.isEmpty {
    print("NO")
} else {
    print(result)   
}


func push(_ i: Int) {
    stack.append(i)
    result += "+\n"
}

func pop() {
    stack.removeLast()
    result += "-\n"
    numIndex += 1
}

// 스택 수열