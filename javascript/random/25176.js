// const n = require('fs').readFileSync("input.txt").toString().split("\n")[0];
const n = require('fs').readFileSync("/dev/stdin").toString().split("\n")[0];
let answer = 1;

for (let i = 1; i <= n; i++) { answer *= i; }
console.log(answer);