// const input = require('fs').readFileSync('input.txt').toString().split("");
const input = require('fs').readFileSync('/dev/stdin').toString().split("");
let last = "";
let answer = 0
let cur = 0

for (const c of input) {
    if (c === "(") {
        cur += 1;
    } else if (c === ")") {
        if (cur === 0) { continue; }
        if (cur > 0) {
            cur -= 1;
            answer += last === "(" ? cur : 1;
        }
    }
    last = c;
}

console.log(answer);