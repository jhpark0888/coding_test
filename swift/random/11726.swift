var count: Int? = Int(readLine() ?? "")

var numberOfCases: [Int:Int] = [:]

for i in 1...count! {
    let initNum = i < 3 ? 1 : 0
    let prev = numberOfCases[i - 1] ?? 0
    let secondPrev = numberOfCases[i - 2] ?? 0
    numberOfCases[i] = (initNum + prev + secondPrev) % 10007
}

print(numberOfCases[count!] ?? 0)