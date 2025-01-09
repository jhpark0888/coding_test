let n = Int(readLine()!)!

var cmdList: [Command] = []
var stack: [Int] = []

enum Command {
    case push(value: Int)
    case pop
    case size
    case empty
    case top

    func excute() {
        switch self {
            case .push(let value):
                stack.append(value) 
                break
            case .pop:
                if stack.isEmpty { print(-1) }
                else { 
                    let last = stack.popLast()
                    print(last!)
                 }
                break
            case .size:
                print(stack.count)
                break
            case .empty:
                print( stack.isEmpty ? 1 : 0 ) 
                break
            case .top:
                print( stack.isEmpty ? -1 : stack[stack.count - 1] ) 
                break
        }
    }
}

for _ in 0..<n {
    let command = readLine()!
    if command.split(separator: " ")[0] == "push" {
        cmdList.append(Command.push(value: Int(command.split(separator: " ")[1])!))
    } else if (command == "pop") {
        cmdList.append(Command.pop)
    } else if (command == "size") {
        cmdList.append(Command.size)
    } else if (command == "empty") {
        cmdList.append(Command.empty)
    } else if (command == "top") {
        cmdList.append(Command.top)
    }
}

for c in cmdList {
    c.excute()
}

// 스택