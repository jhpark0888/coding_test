var dwarfHeights = [Int]()
var spy = -100

for _ in 0..<9 {
    let height = Int(readLine()!)!
    dwarfHeights.append(height)
    spy += height
}

for i in 0..<8 {
    for j in (i + 1)..<9 {
        if dwarfHeights[i] + dwarfHeights[j] == spy {
            dwarfHeights.remove(at: j)
            dwarfHeights.remove(at: i)
            break
        }
    }

    if dwarfHeights.count == 7 {
        break
    }
}

for height in dwarfHeights.sorted() {
    print(height)
}

// 일곱 난쟁이