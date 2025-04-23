// [한양대 HCPC 2023] Yeah, but How?

var input = readLine() ?? ""

var result :String = ""

for char in input {
  
  if char == "(" {
    if result.last == ")" {
      result += "+"
    } else if result.last == "1" {
      result += "+"
    } 
    
    result += String(char)
    result += "1"
  } else if char == ")" {
    if result.last == "+" {
      result += "1"
    }
    result += String(char)
  }
}

print(result)
