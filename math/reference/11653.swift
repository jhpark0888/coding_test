var num = Int(readLine()!)!
var primeFactor = 2

while num > 1 {
    if primeFactor * primeFactor > num {
        print(num)
        break
    }

    if num % primeFactor == 0 {
        print(primeFactor)
        num /= primeFactor
    } else {
        primeFactor += 1
    }
}

// 소인수 분해