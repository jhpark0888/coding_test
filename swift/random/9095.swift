var count: Int? = Int(readLine() ?? "")

var numList: [Int] = []
var numberOfCasesList: [Int : Int] = [:]

for _ in 0..<count! {
    let num: Int? = Int(readLine() ?? "")
    if num == nil { continue }
    
    numList.append(num!)
}

for i in 1...(numList.max() ?? 0 ) {
    let initialNum = i <= 3 ? 1 : 0
    let prev = numberOfCasesList[i - 1] ?? 0
    let secondPrev = numberOfCasesList[i - 2] ?? 0
    let thirdPrev = numberOfCasesList[i-3] ?? 0

    numberOfCasesList[i] = initialNum + prev + secondPrev + thirdPrev
}

for num in numList {
    print(numberOfCasesList[num] ?? 0)
}