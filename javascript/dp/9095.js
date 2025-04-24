const [n, ...input] = require("fs")
  .readFileSync("input.txt")
  .toString()
  .split("\n")
  .map((value) => parseInt(value));
// const [n, ...input] = require("fs")
//   .readFileSync("/dev/stdin")
//   .toString()
//   .split("\n");

let dp = [1, 2, 4];

for (let i = 3; i < Math.max(...input); i++) {
  dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1];
}

for (let i = 0; i < parseInt(n); i++) {
  console.log(dp[input[i] - 1]);
}
