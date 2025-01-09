// print(transform(str: readLine()!))

// func transform(str: String) -> String {
//     var numStack: [String] = []
//     var operStack: [String] = []
//     var inParentheses = ""
//     var parenthesesCount = 0

//     for c in str {
//         if parenthesesCount > 0 && c != "(" && c != ")" {
//             inParentheses += String(c)
//             continue
//         }

//         switch c {
//             case "+", "-":
//                 operStack.append(String(c))
//                 break
//             case "*", "/":
//                 operStack.append(String(c))
//                 break
//             case "(":
//                 inParentheses += String(c)
//                 parenthesesCount += 1
//                 break
//             case ")":
//                 inParentheses += String(c)
//                 parenthesesCount -= 1
//                 if parenthesesCount == 0 {
//                     inParentheses.removeFirst()
//                     inParentheses.removeLast()
//                     let transformed = transform(str: inParentheses)

//                     if (operStack.last == "*" || operStack.last == "/")  {
//                         let n1 = numStack.popLast()!
//                         let oper =  operStack.popLast()!
//                         numStack.append(n1 + transformed + oper)
//                     } else {
//                         numStack.append(transformed)
//                     }
                    
//                     inParentheses = ""
//                 }
//                 break
//             default:
//                 if (operStack.last == "*" || operStack.last == "/")  {
//                     let n1 = numStack.popLast()!
//                     let oper =  operStack.popLast()!
//                     numStack.append(n1 + String(c) + oper)
//                 } else {
//                     numStack.append(String(c))
//                 }
//         }
//     }

//     while numStack.count != 1 {
//         let n1 = numStack.removeFirst()
//         let n2 =  numStack.removeFirst()
//         let oper = operStack.removeFirst()
//         numStack.insert(n1 + n2 + oper, at:0) 
//     }

//     return numStack.last!
// }

var stack = ""
var answer = ""

for c in readLine()! {
    switch c {
        case "(":
            stack.append(c)
            break
        case ")":
            while let last = stack.last, last != "(" {
                answer.append(stack.removeLast())
            }
            stack.removeLast()
            break
        case "*", "/":
            while let last = stack.last, last == "*" || last == "/" {
                answer.append(stack.removeLast())
            }
            stack.append(c)
            break
        case "+", "-":
            while let last = stack.last, last != "(" {
                answer.append(stack.removeLast())
            }
            stack.append(c)
            break
        default:
            answer.append(c)
            break
    }
}

while !stack.isEmpty {
    answer.append(stack.removeLast())
}

print(answer)

// 후위 표기식2