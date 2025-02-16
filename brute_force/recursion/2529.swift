let k = Int(readLine()!)!
var inEqualitySign = readLine()!.split(separator: " ")
var contained = Array(repeating: false, count: 10)
var maxValue = 0
var minValue = Int.max

func back_tracking(stack: String, depth: Int, last: Int) {
    if depth == k + 1 {
        let num = Int(stack)!
        maxValue = max(maxValue, num)
        minValue = min(minValue, num)
        return
    }


    for i in 0...9 {
        if contained[i] { continue }
        if depth > 0 {
            let sign = inEqualitySign[depth - 1]
            if sign == "<" && i < last { continue } 
            if sign == ">" && i > last { continue }
        }
        contained[i] = true
        back_tracking(stack: stack + "\(i)", depth: depth + 1, last: i) 
        contained[i] = false
    }
}

back_tracking(stack: "", depth: 0, last: 0)
print(String(maxValue).count == k + 1 ? maxValue : "0" + String(maxValue) )
print(String(minValue).count == k + 1 ? minValue : "0" + String(minValue) )

// 부등호