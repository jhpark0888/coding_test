let n = Int(readLine()!)!
var s = [[Int]]()
var isTeam = Array(repeating: false, count: n)
var result = Int.max

for _ in 0..<n {
    s.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func getAbility(team: [Int]) -> Int {
    if team.count == 1 { return 0 }
    var sum = 0
    for i in 0..<team.count {
        for j in (i + 1)..<team.count {            
            sum += s[team[i]][team[j]] + s[team[j]][team[i]]
        }
    }
    return sum
}

func back_tracking(start: Int, team: [Int]) {
    let startAbility = getAbility(team: team)
    let linkAbility = getAbility(team: Array(0..<n).filter { !team.contains($0) })
    result = min(result, abs(startAbility - linkAbility))
    if team.count == n - 1 {
        return
    }

    for i in start..<n {
        if !isTeam[i] {
            isTeam[i] = true
            back_tracking(start: i, team: team + [i])
            isTeam[i] = false
        }
    }    
}

isTeam[0] = true
back_tracking(start: 1, team: [0])
print(result)

// 링크와 스타트