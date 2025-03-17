let nmk = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m, k) = (nmk[0], nmk[1], nmk[2])

var answer = min(m, Int(n / 2))
k -= max(0, n - answer * 2) + max(0, m - answer)

while k > 0 {
    k -= 3
    answer -= 1
}

print(answer)

// 대회 or 인턴