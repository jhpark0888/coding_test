// const [n, ...input] = require("fs")
//   .readFileSync("input.txt")
//   .toString()
//   .split("\n");
const [n, ...input] = require("fs")
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");

let dp = Array.from({ length: 100000 }, () => 0);
const mod = 9901;

dp[0] = 3;
dp[1] = 7;

for (let i = 2; i < parseInt(n); i++) {
  dp[i] = (dp[i - 1] * 2 + dp[i - 2]) % mod;
}

console.log(parseInt(dp[n - 1] % mod));
