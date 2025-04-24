// const n = parseInt(require("fs").readFileSync("input.txt").toString());
const n = parseInt(require("fs").readFileSync("/dev/stdin").toString());

let dp = Array.from({length: n + 1}, () => 0);
dp[1] = 1;
var answer = "";

for (let i = 2; i <= n; i++) {
    dp[i] = dp[i - 1] * 2 + 1;
}

function moveDisc(n, from, to, other) {
    if (n === 0) return;
    moveDisc(n - 1, from, other, to);
    answer += `${from} ${to}\n`;
    moveDisc(n - 1, other, to, from);
}

console.log(dp[n]);
moveDisc(n, 1, 3, 2);
console.log(answer);