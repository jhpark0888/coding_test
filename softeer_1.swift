/// [한양대 HCPC 2023] Recovering the Region

var input = Int(readLine() ?? "")

if let count = input {
    for _ in 1...count {
      let _ = (readLine() ?? "").split(separator: " ")
    }

    for idx in 1...count {
      if idx % 2 != 0 {
        for _ in 1...count {
          print(1, terminator: " ")
        }
        print("")
      } else {
        for _ in 1...count {
          print(2, terminator: " ")
        }
        print("")
      }
    }
} else {
  print("Invalid Input")
}