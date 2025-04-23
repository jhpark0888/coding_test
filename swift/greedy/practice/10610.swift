var nums: [Character] = Array(readLine()!).sorted().reversed()

var sum = 0
for n in nums { sum += Int(String(n))! }

if sum % 3 != 0 || !nums.contains("0") {
    print(-1)
} else {
    var maxNum = ""
    for c in nums {
        maxNum.append(c)
    }

    print(maxNum)
}

// 30