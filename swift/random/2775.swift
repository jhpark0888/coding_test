var input = Int(readLine() ?? "")

var klist: [Int] = []
var nlist: [Int] = []

if let caseCount = input {
    for _ in 0..<caseCount {
        let k = Int(readLine() ?? "") 
        let n = Int(readLine() ?? "")
        
        if k != nil && n != nil {
            klist.append(k!)
            nlist.append(n!)
        } 
    }
}

let maxK = klist.max() ?? 0
let maxN = nlist.max() ?? 0

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: maxN), count: maxK + 1)

for k in 0...maxK {
    for n in 1...maxN {
        let nIndex = n - 1
        if k == 0 {
            dp[k][nIndex] = n
            continue
        }

        if n == 1 {
            dp[k][nIndex] = dp[k-1][nIndex]
            continue
        }

        dp[k][nIndex] = dp[k][nIndex - 1] + dp[k-1][nIndex]
    }
}

for i in 0..<klist.count {
    print(dp[klist[i]][nlist[i]-1])
}