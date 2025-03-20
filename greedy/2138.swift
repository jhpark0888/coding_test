let n = Int(readLine()!)!
var originState = Array(readLine()!).map { Int(String($0))! }
let wantedState = Array(readLine()!).map { Int(String($0))! }

func solution(startState: [Int], startCount: Int) -> Int {
    var curState = startState
    var count = startCount
    
    for i in 1..<n {
        if curState[i - 1] != wantedState[i - 1] {
            for d in [-1, 0, 1] {
                guard d + i >= 0 && d + i < n else { continue }
                curState[d + i] ^= 1 
            }
            count += 1
        }
    }

    for i in 0..<n {
        if curState[i] != wantedState[i] { return -1 }
    }

    return count
}

var answer = solution(startState: originState, startCount: 0)
originState[0] ^= 1
originState[1] ^= 1
var answer1 = solution(startState: originState, startCount: 1)

if answer == -1 { 
    print(answer1) 
} else if answer1 == -1 { 
    print(answer) 
} else { 
    print(min(answer, answer1)) 
}

// 전구와 스위치