var input = Int(readLine() ?? "") 
if let length = input {
    let mod = 1_000_000_000

    var map: [Int: Int] = Dictionary(uniqueKeysWithValues: (0...9).map { ($0, $0 == 0 ? 0 : 1) })

    for _ in 1..<length {
        map = calculate(map, mod: mod)
    }
    
    print(map.values.reduce(0, +) % mod)
    
} else {
    print("invalid input")
}

func calculate(_ map: [Int: Int], mod: Int) -> [Int: Int] {
    var result: [Int : Int] = [:]

    for key in map.keys {
        result[key] = ( (map[key - 1] ?? 0) + (map[key + 1] ?? 0) ) % mod
    }

    return result
}

