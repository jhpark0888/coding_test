import Foundation

class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = 0
        while byte != 10 && byte != 32 && byte != 0 { 
            sum += Int(byte) 
            byte = readByte()
        }
        return sum
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

let fileIO = FileIO()
let m = fileIO.readInt()
var s = 0
var result = ""

for _ in 0..<m {
    let operation = fileIO.readStirngSum()
    
    // all
    if operation == 313 {
        s = (1 << 21) - 1
    // empty
    } else if operation == 559 {
        s = 0
    } else {
        let x = fileIO.readInt()
        let bit = 1 << x
        
        switch operation {
        // add
        case 297:
            s |= bit
        // remove
        case 654:
            s &= ~bit
        // check
        case 510:
            result.append("\(s & bit > 0 ? 1 : 0)\n")
        // toggle
        case 642:
            s ^= bit
        default:
            break
        }
    }
}

print(result)

// 집합