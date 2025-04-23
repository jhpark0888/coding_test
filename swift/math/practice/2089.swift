var num = Int(readLine()!)!
var result = ""

while num != 0 {
    var remainder = num % -2
    var quotient = num / -2

    if remainder < 0 {
        remainder += 2
        quotient += 1
    }

    result = String(remainder) + result
    num = quotient
}

print(result.isEmpty ? 0 : result)
// -2진수