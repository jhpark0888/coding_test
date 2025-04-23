var input: Int? = Int(readLine() ?? "")

if let count = input {
  var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 6), count: count)

  for i in 0..<count {
    let amountInput: Int? = Int(readLine() ?? "")

    if let amount = amountInput {
      if i == 0 {
        dp[i][2] = amount
        dp[i][4] = amount
        dp[i][5] = amount
        continue
      }
      
      // 0 : 1  0  0
      // 1 : 0  1  0
      // 2 : 0  0  1
      // 3 : 1  1  0
      // 4 : 1  0  1
      // 5 : 0  1  1
      dp[i][0] = max(dp[i - 1][1], dp[i - 1][3]) 
      dp[i][1] = max(dp[i - 1][2], dp[i - 1][4])
      dp[i][2] = dp[i - 1][0] + amount
      dp[i][3] = dp[i - 1][5] 
      dp[i][4] = max(dp[i - 1][1], dp[i - 1][3]) + amount 
      dp[i][5] = max(dp[i - 1][2], dp[i - 1][4]) + amount 
    
    } else {
      print("invalid Input")
    }
  }

  print(dp[count - 1].max() ?? 0)
} else {
    print("invalid input")
}