let n = Int(readLine()!)!
var s = [[Int]]()
var isTeam = Array(repeating: false, count: n)
var result = Int.max

for _ in 0..<n {
    s.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func getAbility(team: [Int]) -> Int {
    var sum = 0
    for i in 0..<(n / 2) {
        for j in (i + 1)..<(n / 2) {
            sum += s[team[i]][team[j]] + s[team[j]][team[i]]
        }
    }
    return sum
}

func back_tracking(start: Int, team: [Int]) {
    if team.count == n / 2 {
        let start = getAbility(team: team)
        let link = getAbility(team: Array(0..<n).filter { !team.contains($0) })
        result = min(result, abs(start - link))
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

// 스타트와 링크