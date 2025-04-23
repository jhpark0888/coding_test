import Foundation

func solution(_ paramTemperature: Int, _ paramT1:Int, _ paramT2:Int, _ a:Int, _ b:Int, _ onboard:[Int]) -> Int {
    let max : Int = Int.max

    let temperature: Int = paramTemperature + 10
    let t1 : Int = paramT1 + 10
    let t2 : Int = paramT2 + 10

    let length = onboard.count

    var dp: [[Int]] = Array(repeating: Array(repeating: max, count: 51), count: length)
    dp[0][temperature] = 0

    func check(_ i: Int, _ temp: Int) -> Bool {
        if onboard[i] == 0 { return true }
        return t1 <= temp && temp <= t2
    }

    for i in 0..<length - 1 {
        for j in 0..<51 {
            
            if dp[i][j] == max { continue }

            /// 에어컨 안 킨 경우
            var temp = j
            if j < temperature {
                temp += 1 
            } else if j > temperature {
                temp -= 1 
            } 

            if check(i+1, temp) {
                dp[i + 1][temp] = min(dp[i][j], dp[i + 1][temp])
            }

            /// 에어컨 킨 경우
            for (temp, cost) in [(j-1, a), (j+1, a), (j, b)] {
                if !check(i+1, temp) || !(-1 < temp && temp < 51) { continue }
                dp[i+1][temp] = min(dp[i+1][temp], dp[i][j] + cost)
            }
        }
    }    

    return dp[length - 1].min() ?? 0
}